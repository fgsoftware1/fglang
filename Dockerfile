FROM ubuntu:latest

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y --no-install-recommends bash bison flex g++

VOLUME /fglang
WORKDIR /fglang
COPY . .

CMD /bin/bash
RUN ls && bash build.sh
