FROM docker.io/centos:7
LABEL maintainer="CaKrome <cakrome@tutanota.com>"

ARG RSYNC_VERSION
ENV SOURCE_URL=https://download.samba.org/pub/rsync/src/rsync-${RSYNC_VERSION}.tar.gz

WORKDIR /root

COPY openssl3.sh /root/openssl3.sh
COPY zlib.sh /root/zlib.sh
COPY xxhash.sh /root/xxhash.sh
COPY lz4.sh /root/lz4.sh
COPY zstd.sh /root/zstd.sh
COPY attr.sh /root/attr.sh
COPY acl.sh /root/acl.sh
COPY popt.sh /root/popt.sh

RUN set -ex \
    && yum update -y \
    && yum install -y centos-release-scl \
    && yum update -y \
    && yum install -y wget file make gcc gcc-c++ gdb devtoolset-11 devtoolset-11-make devtoolset-11-gcc devtoolset-11-gcc-c++  \
    devtoolset-11-gdb pkgconfig perl-IPC-Cmd perl-Test-Simple \
    && source scl_source enable devtoolset-11 \
    && /root/openssl3.sh \
    && /root/zlib.sh \
    && /root/xxhash.sh \
    && /root/lz4.sh \
    && /root/zstd.sh \
    && /root/attr.sh \
    && /root/acl.sh \
    && /root/popt.sh \
    && cd /root \
    && wget ${SOURCE_URL} \
    && tar -xvf rsync-${RSYNC_VERSION}.tar.gz \
    && cd rsync-${RSYNC_VERSION} \
    && ./configure --prefix=/root/build/rsync-${RSYNC_VERSION} \
    && make -j$((`nproc`+1)) \
    && make install

RUN set -ex \
    && cd /root/build \
    && strip rsync-${RSYNC_VERSION}/bin/rsync \
    && tar -cf rsync-${RSYNC_VERSION}.tar rsync-${RSYNC_VERSION}/ \
    && xz --threads=$((`nproc`+1)) rsync-${RSYNC_VERSION}.tar
