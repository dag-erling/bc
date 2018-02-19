/*
 * Copyright 2018 Contributors
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.

 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *******************************************************************************
 *
 * A special license exemption is granted to the Toybox project to use this
 * source under the following BSD 0-Clause License:
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
 * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
 * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
 * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 *
 *******************************************************************************
 *
 * Generates a const array from a bc script.
 *
 */

#include <stdio.h>

static const char* const bc_gen_usage = "usage: gen bc_script output\n";
static const char* const bc_gen_header =
  "/*\n * *** AUTOMATICALLY GENERATED from %s. DO NOT MODIFY***\n*/\n\n";

#define INVALID_PARAMS (1)
#define INVALID_INPUT_FILE (2)
#define INVALID_OUTPUT_FILE (3)
#define IO_ERR (4)

int main(int argc, char* argv[]) {

  FILE* in;
  FILE* out;
  int c;
  int count;

  if (argc != 3) {
    printf(bc_gen_usage);
    return INVALID_PARAMS;
  }

  in = fopen(argv[1], "r");

  if (!in) return INVALID_INPUT_FILE;

  out = fopen(argv[2], "w");

  if (!out) return INVALID_OUTPUT_FILE;

  count = 0;

  if (fprintf(out, bc_gen_header, basename(argv[1])) < 0) return IO_ERR;

  if (fprintf(out, "const unsigned char bc_lib[] = {\n") < 0) return IO_ERR;

  while ((c = fgetc(in)) >= 0) {

    int val;

    if (!count) {
      if (fprintf(out, "  ") < 0) return IO_ERR;
    }

    val = fprintf(out, "%d,", c);

    if (val < 0) return IO_ERR;

    count += val;

    if (count > 72) {
      if (fputc('\n', out) == EOF) return IO_ERR;
      count = 0;
    }
  }

  if (count) {
    if (fputc('\n', out) == EOF) return IO_ERR;
  }

  if (fprintf(out, "};\n") < 0) return IO_ERR;

  fclose(in);
  fclose(out);

  return 0;
}
