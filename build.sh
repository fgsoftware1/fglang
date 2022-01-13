#! /bin/bash
bison ./src/parser.ypp -o parser.c
flex ./src/lexer.l
g++ lex.yy.c -o fgl
