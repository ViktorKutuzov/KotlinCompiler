@echo off
flex lexer.l
gcc lex.yy.c -o a.exe

type test\input\basic_operators_i.txt | a.exe > test\output\basic_operators_o.txt