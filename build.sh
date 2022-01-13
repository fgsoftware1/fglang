#! /bin/bash
bison ./src/parser.y -o parser.c
flex ./src/lexer.l
g++ lex.yy.c -o fgl
