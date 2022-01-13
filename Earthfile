FROM: ubuntu:20.04

all:
    BUILD +build
    
build:
    COPY src/* ./src
    RUN cd src
    RUN bash linux-deps.sh
    RUN bash build.sh
