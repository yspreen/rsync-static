#!/usr/bin/env bash

set -ex

attr_ver=2.5.1

cd /root
wget https://download.savannah.nongnu.org/releases/attr/attr-$attr_ver.tar.gz

tar -xvf attr-$attr_ver.tar.gz
cd attr-$attr_ver

CFLAGS="-fPIC" ./configure --enable-shared=no --prefix=/usr
make -j$((`nproc`+1))
make install
