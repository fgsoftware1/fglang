#! /bin/bash
bison ./src/parser.y -o parser.c
flex -o lexer.c ./src/lexer.l
g++ lexer.c -o fgl
