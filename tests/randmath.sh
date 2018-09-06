#! /bin/bash

gen()
{
	limit="$1"
	shift

	result=$(dd if=/dev/urandom bs="$limit" count=1 2>/dev/null | od -t u4 | awk 'NR==1 {print $2}')
	echo -n "$result"
}

neg()
{
	result=$(gen 1)
	result="$((result & 1))"
	echo -n "$result"
}

zero()
{
	result=$(gen 1)
	echo -n "$result"
}

limit()
{
	max="$1"
	shift

	result=$(gen 1)
	result=$(expr "$result" % "$max")
	echo -n $(expr "$result" + 1)
}

num()
{
	n=""

	neg=$1
	shift

	real=$1
	shift

	zero=$1
	shift

	if [ "$#" -gt 0 ]; then
		limit="$1"
		shift
	else
		limit="$(limit 4)"
	fi

	if [ "$zero" -ne 0 ]; then
		z=$(zero)
	else
		z=1
	fi

	if [ "$z" -eq 0 ]; then
		n="0"
	else

		if [ "$neg" -ne 0 ]; then

			neg=$(neg)

			if [ "$neg" -eq 0 ]; then
				n="-"
			fi
		fi

		g=$(gen $limit)
		n="${n}${g}"

		if [ "$real" -ne 0 ]; then

			z=$(neg)

			if [ "$z" -ne 0 ]; then

				limit=$(limit 25)
				g=$(gen $limit)
				n="$n.$g"
			fi
		fi
	fi

	echo -n "$n"
}

ops=( '+' '-' '*' '/' '%' '^' )
files=( "add" "subtract" "multiply" "divide" "modulus" "power" "sqrt" "e_power"
        "log" "arctangent" "sine" "cosine" "bessel" )
funcs=( "sqrt" "e" "l" "a" "s" "c" "j" )

script="$0"

testdir=$(dirname "$script")

if [ "$#" -gt 0 ]; then
	bc="$1"
	shift
else
	bc="$testdir/../bc"
fi

if [ "$#" -gt 0 ]; then
	out1="$1"
	shift
else
	out1="$testdir/../log_bc.txt"
fi

if [ "$#" -gt 0 ]; then
	out2="$1"
	shift
else
	out2="$testdir/../log_test.txt"
fi

t=0

while true; do

	rm -rf "$out1"
	rm -rf "$out2"

	line=""

	operator=$(gen 1)

	op=$(expr "$operator" % 13)

	if [ "$op" -lt 6 ]; then

		line="$(num 1 1 1) ${ops[$op]}"

		if [ "$op" -eq 3 -o "$op" -eq 4 ]; then

			number=$(num 1 1 0)

			scale=$(num 0 0 1 1)
			scale=$(echo "s = $scale % 25; s /= 1; s" | bc)

			line="scale = $scale; $line"

		elif [ "$op" -eq 5 ]; then
			number=$(num 1 0 1 1)
		else
			number=$(num 1 1 1)
		fi

		line="$line $number"

	else

		if [ "$op" -eq 6 ]; then
			number=$(num 0 1 1)
		elif [ "$op" -eq 7 -o "$op" -eq 12 ]; then

			number=$(num 1 1 1 1)

			if [ "$op" -eq 12 ]; then
				number=$(echo "n = $number % 100; scale = 8; n /= 1; n" | bc)
			fi

		else
			number=$(num 1 1 1)
		fi

		func=$(expr "$op" - 6)
		line="${funcs[$func]}($number"

		if [ "$op" -ne 12 ]; then
			line="$line)"
		else
			n=$(num 1 1 1)
			n=$(echo "n = $n % 100; scale = 8; n /= 1; n" | bc)
			line="$line, $n)"
		fi
	fi

	echo "Test $t: $line"

	echo "$line; halt" | bc -lq > "$out1"
	echo "$line; halt" | "$bc" -lq > "$out2"

	error="$?"

	if [ "$error" -ne 0 ]; then
		echo "    bc returned an error ($error); exiting..."
		exit "$error"
	fi

	diff "$out1" "$out2" > /dev/null

	error="$?"

	if [ "$error" -ne 0 ]; then
		echo "    failed; adding \"$line\" to test suite..."
		echo "$line" >> "$testdir/${files[$op]}.txt"
		cat "$out1" >> "$testdir/${files[$op]}_results.txt"
		echo "    exiting..."
		exit 127
	fi

	t=$(expr "$t" + "1")

done

