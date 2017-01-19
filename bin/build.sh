#!/bin/bash

cd /build
git clone https://github.com/vyos/build-iso.git
cd /build/build-iso

export PATH=/sbin:/usr/sbin:$PATH
autoreconf -i
./configure # --with-kernel-flavor=amd64-vyos

make iso
ls -lh livecd/binary.iso
