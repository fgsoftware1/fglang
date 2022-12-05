#! /bin/bash
bison ./src/parser.y
flex  ./src/lexer.l
cc lex.yy.c -o fgl
