#!/usr/bin/env bash

set -ex

rsync_ver=3.2.7
PLATFORM=linux/amd64

sudo docker buildx build --platform $PLATFORM -f Dockerfile . -t cakrome/rsync-static --build-arg RSYNC_VERSION=$rsync_ver
sudo docker run --platform $PLATFORM --rm -it -v $(pwd):/workspace -w /root/build cakrome/rsync-static cp rsync-$rsync_ver.tar.xz /workspace
sudo chown $USER:`id -g` rsync-$rsync_ver.tar.xz
