@echo off
flex lexer.l
gcc lex.yy.c -o a.exe

type test\input\basic_operators_i.txt | a.exe > test\output\basic_operators_o.txt
type test\input\double_numbers_i.txt | a.exe > test\output\double_numbers_o.txt
type test\input\e_double_numbers_i.txt | a.exe > test\output\e_double_numbers_o.txt
type test\input\floating_points_numbers_i.txt | a.exe > test\output\floating_points_numbers_o.txt