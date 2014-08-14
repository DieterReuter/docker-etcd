# Dockerfile for etcd 
# https://github.com/coreos/etcd

FROM ubuntu:14.04
MAINTAINER Dieter Reuter <dieter.reuter@me.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" > /etc/apt/sources.list
RUN apt-get -yy update
RUN apt-get -yy upgrade


# install Supervisor and other tools
RUN apt-get -yy install supervisor wget curl git-core


# install etcd deps


# install etcd
#RUN wget -O amc.deb http://www.aerospike.com/download/amc/3.4.5/artifact/ubuntu12 && \
#    dpkg -i amc.deb && \
#    rm amc.deb

# use etcd ports 4001/tcp, 7001/tcp
EXPOSE 4001 7001


# copy our Supervisor service definition
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# use Supervisor Status webport 9001/tcp
EXPOSE 9001


# start Supervisor and all defined services
CMD ["/usr/bin/supervisord"]
