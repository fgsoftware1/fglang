VERSION 0.6
FROM ubuntu:impish-20211015
WORKDIR /fglanguage

build:
    COPY src/* .
    RUN bison parser.y -o parser.c
    RUN flex src/lexer.l
    RUN g++ lex.yy.c -o fgl
    COPY parser.c build/
    COPY lex.yy.c build/
    COPY fgl build/
    SAVE ARTIFACT build/fgl /fgl AS LOCAL build/fgl
docker:
    COPY +build/fgl .
    ENTRYPOINT ["/fglanguage/fgl"]
    SAVE IMAGE fgygh/fglanguage:latest
