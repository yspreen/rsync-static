#!/bin/bash

set -ex

popt_ver=1.19

cd /root
wget https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-$popt_ver.tar.gz

tar -xvf popt-$popt_ver.tar.gz
cd popt-$popt_ver

CFLAGS="-fPIC" ./configure --enable-shared=no --prefix=/usr
make -j$((`nproc`+1))
make install
