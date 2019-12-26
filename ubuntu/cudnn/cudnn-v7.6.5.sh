#!/bin/bash

# CUDA_VERSION=10.2
# untar
tar -xzvf files/cudnn-${CUDA_VERSION}-linux-x64-v7.6.5.32.tgz
# copy header and lib files
cp cuda/include/cudnn.h /usr/local/cuda/include
cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# remove extracted folder
rm -rf cuda