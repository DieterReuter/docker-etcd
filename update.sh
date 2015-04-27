#!/bin/sh
set -e
set -x

# cleanup and create new rootfs dir
rm -fr rootfs/
mkdir -p rootfs/etc/ssl/certs/

# add latest ca-certificates.crt from Debian upstream
(cd rootfs/etc/ssl/certs/; \
    wget https://github.com/hypriot/rpi-swarm/raw/master/certs/ca-certificates.crt)

# add latest etcd binary
ETCD_VERSION="2.0.10"
(cd rootfs; \
    wget https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz; \
    tar --strip-components=1 -xvzf etcd-v${ETCD_VERSION}-linux-amd64.tar.gz \
        etcd-v${ETCD_VERSION}-linux-amd64/etcd \
        etcd-v${ETCD_VERSION}-linux-amd64/etcdctl; \
    rm -f etcd-v${ETCD_VERSION}-linux-amd64.tar.gz; \
    ls -al etcd*)

# create complete tarball
(cd rootfs; \
    tar cvzf ../rootfs.tar.gz .)

# remove etcd binary
rm -fr rootfs/etcd*
