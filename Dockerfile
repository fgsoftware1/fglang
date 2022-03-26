FROM ubuntu:21.10

ENV TZ=Europe/Lisbon

VOLUME /home/admin/Desktop/projects
WORKDIR /home/admin/Desktop/projects

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone &&\
    apt-get update && apt-get install -y --no-install-recommends apt-utils &&\
    apt-get install -y --no-install-recommends sudo git ca-certificates &&\
    useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo\
    sudo /bin/sh -c 'wget https://github.com/earthly/earthly/releases/latest/download/earthly-linux-amd64 -O /usr/local/bin/earthly && chmod +x /usr/local/bin/earthly && /usr/local/bin/earthly bootstrap --with-autocomplete'
USER root
CMD /bin/bash
RUN cd /home/admin/Desktop/projects/ &&\
    git clone --depth 1 https://github.com/fgsoftware1/fglanguage.git &&\
    cd fglanguage &&\
    apt-get update &&\
    sudo bash linux-deps.sh
