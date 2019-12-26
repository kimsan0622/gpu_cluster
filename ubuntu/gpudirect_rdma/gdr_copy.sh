#!/bin/bash

# install requirements
apt install -y check libsubunit0 libsubunit-dev numactl

# install requirements 
apt-get install -y devscripts build-essential lintian

# download gdr copy repository
git clone https://github.com/NVIDIA/gdrcopy.git
pushd gdrcopy/packages
CUDA=/usr/local/cuda ./build-deb-packages.sh
dpkg -i gdrdrv-dkms_2.0_amd64.deb
dpkg -i gdrcopy_2.0_amd64.deb
popd
rm -rf dgrcopy