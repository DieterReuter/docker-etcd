FROM scratch
MAINTAINER Dieter Reuter <dieter.reuter@me.com>

ADD rootfs.tar.gz /

VOLUME /data
EXPOSE 2379 2380 4001 7001

ENTRYPOINT ["/etcd"]
CMD ["-data-dir=/data"]
