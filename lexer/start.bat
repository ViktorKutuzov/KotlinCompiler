@echo off
del /q test\output\*

flex lexer.l
gcc lex.yy.c -o a.exe

type test\input\basic_operators_i.txt | a.exe > test\output\basic_operators_o.txt
type test\input\double_numbers_i.txt | a.exe > test\output\double_numbers_o.txt
type test\input\e_double_numbers_i.txt | a.exe > test\output\e_double_numbers_o.txt
type test\input\string_literal_i.txt | a.exe > test\output\string_literal_o.txt
type test\input\several_underlines_in_number_i.txt | a.exe > test\output\several_underlines_in_number_o.txt
type test\input\single_line_comment_i.txt | a.exe > test\output\single_line_comment_o.txt
type test\input\multiline_string_i.txt | a.exe > test\output\multiline_string_o.txt
type test\input\interpolation_i.txt | a.exe > test\output\interpolation_o.txt
type test\input\multiline_comments_i.txt | a.exe > test\output\multiline_comments_o.txt