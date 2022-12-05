#! /bin/bash
bison ./src/parser.y
flex  ./src/lexer.l
cc lex.yy.c y.tab.c -o fgl
