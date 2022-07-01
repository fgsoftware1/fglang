FROM ubuntu:21.10

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

VOLUME /fglang
WORKDIR /fglang
COPY . .
CMD /bin/bash
RUN bash linux-deps.sh &&\
    bash build.sh

