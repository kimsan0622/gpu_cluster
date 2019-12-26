#!/bin/bash
# CUDA_VERSION=10.2

if [ "${CUDA_VERSION}" == "10.2" ]; then
    bash cuda10.2.sh
elif [ "${CUDA_VERSION}" == "10.1" ]; then
    bash cuda10.1.u2.sh
elif [ "${CUDA_VERSION}" == "10.0" ]; then
    bash cuda10.0.sh
fi