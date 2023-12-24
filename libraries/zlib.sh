#!/usr/bin/env bash

set -ex

zlib_ver=1.3

cd /root
wget https://zlib.net/zlib-$zlib_ver.tar.gz

tar -xvf zlib-$zlib_ver.tar.gz
cd zlib-$zlib_ver

CFLAGS="-fPIC" ./configure --prefix=/usr --static
make -j$((`nproc`+1))
make install
