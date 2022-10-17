#!/bin/bash

set -ex

acl_ver=2.3.1

cd /root
wget https://download.savannah.nongnu.org/releases/acl/acl-$acl_ver.tar.gz

tar -xvf acl-$acl_ver.tar.gz
cd acl-$acl_ver

CFLAGS="-fPIC" ./configure --enable-shared=no --prefix=/usr
make -j$((`nproc`+1))
make install
