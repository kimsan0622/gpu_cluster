#!/bin/bash
# CUDA_VERSION=10.2

# NCCL v2.5.6 for CUDA 10.2 - 18.04, 16.04 because CUDA 10.2 supports 18.04 and 16.04
# NCCL v2.5.6 for CUDA 10.1 - 18.04, 16.04, 14.04
# NCCL v2.5.6 for CUDA 10.1 - 18.04, 16.04, 14.04

release_str=$( lsb_release -a | grep Release )
UBUNTU_VER=$(echo $release_str| cut -d' ' -f 2)

# if you didn't install repository, pass the argument 0
if [ ${1} == 0 ]; then
    if [ "${UBUNTU_VER}" == "14.04" ]; then
        #14.04
        wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb
        dpkg -i nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb
        apt update
        rm -rf nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb
    elif [ "${UBUNTU_VER}" == "16.04" ]; then
        #16.04
        wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
        dpkg -i nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
        apt update
        rm -rf nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
    elif [ "${UBUNTU_VER}" == "18.04" ]; then
        #18.04
        wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
        dpkg -i nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
        apt update
        rm -rf nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
    fi
fi

apt install libnccl2=2.5.6-1+cuda${CUDA_VERSION} libnccl-dev=2.5.6-1+cuda${CUDA_VERSION}
