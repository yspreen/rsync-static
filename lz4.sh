#!/bin/bash

set -ex

lz4_ver=1.9.4

cd /root
wget https://github.com/lz4/lz4/archive/refs/tags/v$lz4_ver.tar.gz

tar -xvf v$lz4_ver.tar.gz
cd lz4-$lz4_ver

CFLAGS="-fPIC" make -j$((`nproc`+1)) install PREFIX=/usr
rm /usr/lib/liblz4.so /usr/lib/liblz4.so.1 /usr/lib/liblz4.so.$lz4_ver
