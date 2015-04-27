# minimized Docker image for etcd

## Fetch latest versions and create `rootfs.tar.gz`
```bash
./update.sh
```

## Build it
```bash
docker build -t etcd .
```

## Check it
```bash
docker run --rm -ti etcd --version
etcd version 2.0.10
```

## Run it --- this is WIP ---
```bash
docker run --rm -ti -p 2379:2379 -p 2380:2380 -p 4001:4001 -p 7001:7001 etcd
```
