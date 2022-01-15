FROM ubuntu:impish-20211015

VOLUME /home/admin/Desktop/projects
WORKDIR /home/admin/Desktop/projects

RUN apt-get update && \
    apt-get install -y git g++ g++-multilib sudo --no-install-recommends && \ 
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
CMD /bin/bash
COPY ./ /home/admin/Desktop/projects/fglanguage/
