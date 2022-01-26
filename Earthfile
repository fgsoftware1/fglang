FROM ubuntu:impish-20211015

docker:
    VOLUME /home/admin/Desktop/projects
    WORKDIR /home/admin/Desktop/projects

    RUN apt-get update && \
        apt-get install -y git g++ g++-multilib sudo --no-install-recommends && \
        useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
    USER root
    CMD /bin/bash
    COPY ./ /home/admin/Desktop/projects/fglanguage/
    RUN cd /home/admin/Desktop/projects/fglanguage/ && \
        sudo bash linux-build.sh && \
        sudo bash build.sh

build:
    COPY ./* ./fglanguage/
    RUN cd src
    RUN bash linux-deps.sh
    RUN bash build.sh
