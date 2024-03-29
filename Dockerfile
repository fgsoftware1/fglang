FROM ubuntu:kinetic

RUN apt-get update && apt-get install -y --no-install-recommends bash bison flex gcc gcc-multilib

VOLUME /fglang
WORKDIR /fglang
COPY . .