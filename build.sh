#! /bin/bash
bison ./src/parser.y
flex  ./src/lexer.l
cc lexer.c -o fgl
