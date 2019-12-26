#!/bin/bash

# download nv_peer_mem
git clone https://github.com/Mellanox/nv_peer_memory.git

pushd nv_peer_memory
./build_module.sh

pushd /tmp
tar xzf /tmp/nvidia-peer-memory_1.0.orig.tar.gz
pushd nvidia-peer-memory-1.0
dpkg-buildpackage -us -uc
popd
dpkg -i nvidia-peer-memory_1.0-8_all.deb
dpkg -i nvidia-peer-memory-dkms_1.0-8_all.deb
popd
popd

rm -rf nv_peer_memory