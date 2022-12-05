#! /bin/bash
bison ./src/parser.y -o parser.cpp
flex -o lexer.c ./src/lexer.l
cc lexer.c -o fgl
