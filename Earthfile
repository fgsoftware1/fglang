FROM ubuntu:impish-20211015

WORKDIR .

docker:
    VOLUME /home/admin/Desktop/projects
    WORKDIR /home/admin/Desktop/projects

    RUN apt-get update && \
        apt-get install -y git g++ g++-multilib sudo bison flex --no-install-recommends && \
        useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
    USER root
    CMD /bin/bash
    COPY ./ /home/admin/Desktop/projects/fglanguage/
    RUN cd /home/admin/Desktop/projects/fglanguage/ && \
        sudo bash build.sh
    SAVE IMAGE fgygh/fglanguage:latest

build:
    RUN apt-get update && \
        apt-get install -y sudo --no-install-recommends
    RUN sudo bash linux-deps.sh && \
        bash build.sh
