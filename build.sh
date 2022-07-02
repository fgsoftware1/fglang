#! /bin/bash
bison ./src/parser.y -o parser.cpp
flex -o lexer.c ./src/lexer.l
g++ lexer.c -o fgl
