$ $
$ SPDX-License-Identifier: BSD-2-Clause
$ $
$ Copyright (c) 2018-2025 Gavin D. Howard and contributors.
$ $
$ Redistribution and use in source and binary forms, with or without
$ modification, are permitted provided that the following conditions are met:
$ $
$ * Redistributions of source code must retain the above copyright notice, this
$   list of conditions and the following disclaimer.
$ $
$ * Redistributions in binary form must reproduce the above copyright notice,
$   this list of conditions and the following disclaimer in the documentation
$   and/or other materials provided with the distribution.
$ $
$ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
$ AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
$ IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
$ ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
$ LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
$ CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
$ SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
$ INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
$ CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
$ ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
$ POSSIBILITY OF SUCH DAMAGE.
$ $

$quote "

$ Typy b��d�w.
$set 1

1 "B��d matematyczny:"
2 "B��d parse'a:"
3 "B��d biegu:"
4 "B��d �miertelny:"
5 "Ostrze�enie:"

$ B��dy matematyczne.
$set 2

1 "liczba ujemna"
2 "numer nieintegracyjny"
3 "przelewanie: liczba nie mie�ci si� w numerze sprz�towym"
4 "dzielenie przez 0"

$ B��dy Parse'a.
$set 3

1 "koniec akt"
2 "niewa�ny znak '%c'"
3 "koniec sznurka nie m�g� by� znaleziony"
4 "koniec komentarza nie m�g� by� znaleziony"
5 "niewa�ny token"
6 "niewa�ne wyra�enie"
7 "puste wyra�enie"
8 "nieprawid�owe polecenie drukowania lub przesy�ania strumienia"
9 "nieprawid�owa definicja funkcji"
10 "nieprawid�owe przyporz�dkowanie: lewa strona musi by� elementem scale, ibase, obase, last, var lub element array"
11 "nie znaleziono zmiennej automatycznej"
12 "parametr funkcji lub auto \"%s%s\" ju� istnieje"
13 "ko�ca bloku nie mo�na by�o znale��"
14 "nie mo�e zwr�ci� warto�ci z funkcji void: %s()"
15 "var nie mo�e by� odniesieniem: %s"
16 "POSIX nie zezwala na nazwy d�u�sze ni� 1 znak: %s"
17 "POSIX nie pozwala na komentarze skryptu '#'"
18 "POSIX nie pozwala na u�ycie nast�puj�cego s�owa kluczowego: %s"
19 "POSIX nie dopuszcza kropki ('.') jako skr�tu do ostatniego wyniku"
20 "POSIX wymaga nawias�w wok� wyra�e� zwrotnych"
21 "POSIX nie pozwala nast�puj�cemu operatorowi: %s"
22 "POSIX nie pozwala na por�wnywanie operator�w na zewn�trz, je�li deklaracje lub p�tle"
23 "POSIX wymaga 0 lub 1 operatora por�wnawczego na jeden warunek"
24 "POSIX wymaga, aby wszystkie 3 cz�ci p�tli nie by�y puste"
25 "POSIX wymaga nowej linii pomi�dzy �rednikiem a definicj� funkcji"
26 "POSIX nie pozwala na notacj� wyk�adnicz�"
27 "POSIX nie zezwala na odniesienia do tablicy jako parametr�w funkcji"
28 "POSIX nie dopuszcza funkcji void"
29 "POSIX wymaga, aby lewe usztywnienie znajdowa�o si� na tej samej linii co nag��wek funkcji"
30 "POSIX nie pozwala na przypisywanie ci�g�w znak�w do zmiennych lub tablic"

$ B��dy Runtime'u.
$set 4

1 "nieprawid�owa ibase: musi by� [%lu, %lu]"
2 "nieprawid�owa obase: musi by� [%lu, %lu]"
3 "nieprawid�owa scale: musi by� [%lu, %lu]"
4 "nieprawid�owe wyra�enie read()"
5 "powtarzalne wywo�anie read()"
6 "element zmienny lub tablicowy jest niew�a�ciwym typem"
7 "stos ma zbyt ma�o element�w"
8 "stos dla rejestru \"%s\" ma zbyt ma�o element�w"
9 "niew�a�ciwa liczba parametr�w; potrzeba %zu, maj� %zu"
10 "niezdefiniowana funkcja: %s()"
11 "nie mo�e u�y� warto�ci pustej w wyra�eniu"

$ Fatalne b��dy.
$set 5

1 "Alokacja pami�ci nie powiod�a si�"
2 "B��d we/wy"
3 "nie m�g� otworzy� pliku: %s"
4 "plik nie jest tekstem: %s"
5 "�cie�ka to katalog: %s"
6 "nieprawid�owa opcja wiersza polece�: \"%s\""
7 "opcja wymaga argumentu: '%c' (\"%s\")"
8 "opcja nie wymaga �adnych argument�w: '%c' (\"%s\")"
9 "nieprawid�owa argument opcja wiersza polece�: \"%s\""
