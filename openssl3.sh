#!/bin/bash

set -ex

openssl_ver=3.0.5

cd /root
wget https://www.openssl.org/source/openssl-$openssl_ver.tar.gz

tar -xvf openssl-$openssl_ver.tar.gz
cd openssl-$openssl_ver

/usr/bin/perl ./Configure no-shared --prefix=/usr --openssldir=/etc/ssl
make -j$((`nproc`+1))
make install_sw install_ssldirs
