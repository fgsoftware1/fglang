FROM ubuntu:22.04

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y --no-install-recommends bash bison flex gcc

VOLUME /fglang
WORKDIR /fglang
COPY . .

CMD /bin/bash
RUN ls && bash build.sh
