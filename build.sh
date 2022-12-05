#! /bin/bash
yacc -d src/parser.y
lex src/lexer.l
cc lex.yy.c parser.tab.c -o fgl
