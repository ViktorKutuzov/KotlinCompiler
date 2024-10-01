@echo off
flex lexer.l
gcc lex.yy.c -o a.exe

type test\input\basic_for_in.txt | a.exe > test\output\basic_for_ou.txt