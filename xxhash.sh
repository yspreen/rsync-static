#!/bin/bash

set -ex

xxhash_ver=0.8.1

cd /root
wget https://github.com/Cyan4973/xxHash/archive/refs/tags/v$xxhash_ver.tar.gz

tar -xvf v$xxhash_ver.tar.gz
cd xxHash-$xxhash_ver

CFLAGS="-fPIC" make -j$((`nproc`+1)) install PREFIX=/usr
rm /usr/lib/libxxhash.so /usr/lib/libxxhash.so.0 /usr/lib/libxxhash.so.$xxhash_ver
