FROM ubuntu:21.10

ENV TZ=Europe/Lisbon

VOLUME /home/admin/Desktop/projects
WORKDIR /home/admin/Desktop/projects

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    apt-get update && apt-get install -y --no-install-recommends apt-utils

CMD /bin/bash
RUN cd /home/admin/Desktop/projects/fglanguage &&\
    apt-get update &&\
    sudo bash linux-deps.sh &&\
    bash build.sh
