#! /bin/bash
bison ./src/parser.ypp -o parser.cpp
flex ./src/lexer.l
g++ lex.yy.c -o fgl
