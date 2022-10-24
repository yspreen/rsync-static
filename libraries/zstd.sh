#!/usr/bin/env bash

set -ex

zstd_ver=1.5.2

cd /root
wget https://github.com/facebook/zstd/releases/download/v$zstd_ver/zstd-$zstd_ver.tar.gz

tar -xvf zstd-$zstd_ver.tar.gz
cd zstd-$zstd_ver

CFLAGS="-fPIC" make -j$((`nproc`+1)) install PREFIX=/usr
rm /usr/lib/libzstd.so /usr/lib/libzstd.so.1 /usr/lib/libzstd.so.$zstd_ver
