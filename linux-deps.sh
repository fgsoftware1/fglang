#! /bin/sh
apt-get update &&\
apt-get upgrade -y &&\
apt-get install -y --no-install-recommends bison flex g++ g++-multilib wget ca-certificates
