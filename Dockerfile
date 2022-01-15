FROM ubuntu:impish-20211015

VOLUME /home/admin/Desktop/projects
WORKDIR /home/admin/Desktop/projects

RUN apt-get update && apt-get install -y --no-install-recommends sudo git ca-certificates &&\
    useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER root
CMD /bin/bash
RUN cd /home/admin/Desktop/projects/ &&\
    git clone --depth 1 https://github.com/fgsoftware1/fglanguage.git &&\
    cd fglanguage &&\
    apt-get update &&\
    sudo bash linux-deps.sh
