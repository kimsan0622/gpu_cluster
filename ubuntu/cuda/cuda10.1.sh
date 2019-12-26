#!/bin/bash

release_str=$( lsb_release -a | grep Release )
UBUNTU_VER=$(echo $release_str| cut -d' ' -f 2)

if [ "${UBUNTU_VER}" == "14.04" ]; then
    #14.04
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_10.1.105-1_amd64.deb
    dpkg -i cuda-repo-ubuntu1404_10.1.105-1_amd64.deb
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub
    apt-get update
    apt-get install -y cuda
    rm -rf cuda-repo-ubuntu1404_10.1.105-1_amd64.deb
elif [ "${UBUNTU_VER}" == "16.04" ]; then
    #16.04
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.1.105-1_amd64.deb
    dpkg -i cuda-repo-ubuntu1604_10.1.105-1_amd64.deb
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    sudo apt-get update
    apt-get install -y cuda
    rm -rf cuda-repo-ubuntu1604_10.1.105-1_amd64.deb
elif [ "${UBUNTU_VER}" == "18.04" ]; then
    #18.04
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.105-1_amd64.deb
    dpkg -i cuda-repo-ubuntu1804_10.1.105-1_amd64.deb
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
    sudo apt-get update
    apt-get install -y cuda
    rm -rf cuda-repo-ubuntu1804_10.1.105-1_amd64.deb
elif [ "${UBUNTU_VER}" == "18.10" ]; then
    #18.10
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1810/x86_64/cuda-repo-ubuntu1810_10.1.105-1_amd64.deb
    dpkg -i cuda-repo-ubuntu1810_10.1.105-1_amd64.deb
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1810/x86_64/7fa2af80.pub
    sudo apt-get update
    apt-get install -y cuda
    rm -rf cuda-repo-ubuntu1810_10.1.105-1_amd64.deb
fi