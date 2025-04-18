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

$ エラーの種類。
$set 1

1 "数学のエラー："
2 "パースエラー："
3 "ランタイムエラー："
4 "致命的なエラー："
5 "警告："

$ 数学のエラーです。
$set 2

1 "負の数"
2 "非整数"
3 "オーバーフロー：数字がハードウェア番号に収まらない"
4 "0で割る"

$ 構文解析のエラー。
$set 3

1 "ファイルの終了"
2 "無効な文字 '%c'"
3 "文字列の終端が見つかりませんでした"
4 "コメントエンドが見つかりませんでした"
5 "無効なトークン"
6 "無効な式"
7 "空の式"
8 "無効なprintまたはstream文"
9 "無効な関数定義"
10 "無効な代入：左側は scale, ibase, obase, last, var, または配列要素でなければなりません"
11 "自動変数が見つかりませんでした"
12 "関数パラメータまたは自動\"%s%s\"はすでに存在します"
13 "ブロックエンドが見つかりませんでした"
14 "void 関数から値を返すことはできません：%s()"
15 "varは参照にできません：%s"
16 "POSIX は 1 文字より長い名前を許可しません：%s"
17 "POSIX は '#' スクリプトのコメントを許可しません。"
18 "POSIX は以下のキーワードを許可しません：%s"
19 "POSIX は最後の結果のショートカットとしてピリオド ('.') を許可しません。"
20 "POSIX は戻り値式の周りに括弧を必要とします。"
21 "POSIX は次の演算子を許可しません：%s"
22 "POSIX は if 文やループの外の比較演算子を許可しません。"
23 "POSIXは条件ごとに0または1の比較演算子を必要とします。"
24 "POSIXはforループの3つの部分がすべて空でないことを要求します。"
25 "POSIXでは、セミコロンと関数定義の間に改行を入れる必要があります。"
26 "POSIXは指数表記を許可しません。"
27 "POSIX は関数パラメータとして配列参照を許可しません。"
28 "POSIXではvoid関数を認めていません。"
29 "POSIXでは、関数ヘッダと同じ行に左中括弧があることが必要です。"
30 "POSIXでは、変数や配列に文字列を割り当てることはできません。"

$ ランタイムエラー。
$set 4

1 "無効なibase：は[%lu、%lu]でなければなりません"
2 "無効なobase：は[%lu、%lu]でなければなりません"
3 "無効なscale：は[%lu、%lu]でなければなりません"
4 "式が無効read()"
5 "再帰的読み込み()呼び出し"
6 "変数または配列要素の型が間違っている"
7 "スタックの要素が少なすぎる"
8 "レジスタ\"%s\"のスタックの要素が少なすぎる"
9 "パラメータの数が間違っています。"
10 "定義されていない関数：%s()"
11 "式では void 値を使用できません"

$ 致命的なエラーが発生しました。
$set 5

1 "メモリの割り当てに失敗しました"
2 "I/Oエラー"
3 "ファイルを開けませんでした。%s"
4 "ファイルがテキストではない：%s"
5 "パスはディレクトリです：%s"
6 "無効なコマンドラインオプション：\"%s\""
7 "オプションには引数が必要です：'%c' (\"%s\")"
8 "オプションは引数を取りません：'%c' (\"%s\")"
9 "無効なコマンドラインオプション引数： \"%s\"
