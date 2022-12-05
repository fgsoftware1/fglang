#! /bin/bash
bison -d src/parser.y
flex src/lexer.l
cc lex.yy.c parser.tab.c -o fgl -I . -I src/
