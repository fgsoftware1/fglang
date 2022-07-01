FROM ubuntu:21.10

ENV TZ=Europe/Lisbon

VOLUME /home/admin/Desktop/projects
WORKDIR /home/admin/Desktop/projects

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

CMD /bin/bash
RUN bash /home/admin/Desktop/projects/fglanguage/linux-deps.sh &&\
    bash /home/admin/Desktop/projects/fglanguage/build.sh
