#!/bin/bash

release_str=$( lsb_release -a | grep Release )
UBUNTU_VER=$(echo $release_str| cut -d' ' -f 2)

if [ "${UBUNTU_VER}" == "14.04" ]; then
    #14.04
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub
    add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/ /"
    apt-get update
    apt-get -y install cuda
elif [ "${UBUNTU_VER}" == "16.04" ]; then
    #16.04
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-ubuntu1604.pin
    mv cuda-ubuntu1604.pin /etc/apt/preferences.d/cuda-repository-pin-600
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/ /"
    apt-get update
    apt-get -y install cuda
elif [ "${UBUNTU_VER}" == "18.04" ]; then
    #18.04
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
    mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
    add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
    apt-get update
    apt-get -y install cuda
fi