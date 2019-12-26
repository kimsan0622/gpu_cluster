#!/bin/bash

#version_val=$( lsb_release -a | grep -o -e "Ubuntu [0-9][0-9].[0-9][0-9].[0-9]" )
version_str=$( lsb_release -a | grep Description )
UBUNTU_VER_FULL=$(echo $version_str| cut -d' ' -f 3)

release_str=$( lsb_release -a | grep Release )
UBUNTU_VER=$(echo $release_str| cut -d' ' -f 2)

function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

MOFED_VER=4.7-1.0.0.1
OS_VER=ubuntu${UBUNTU_VER}
PLATFORM=x86_64


MOFED_47=("14.04.06" "16.04.6" "18.04.2" "18.04.3" "19.4")
MOFED_46=("14.04.05" "16.04.4" "16.04.5" "18.04.1" "18.04.2")
MOFED_45=("14.04.03" "14.04.04" "16.04.4" "16.04.5" "18.04" "18.04.1" "18.10")

if [ $(contains "${MOFED_45[@]}" "${UBUNTU_VER_FULL}") == "y" ]; then
    MOFED_VER=4.5-1.0.1.0
elif [ $(contains "${MOFED_46[@]}" "${UBUNTU_VER_FULL}") == "y" ]; then
    MOFED_VER=4.6-1.0.1.1
elif [ $(contains "${MOFED_47[@]}" "${UBUNTU_VER_FULL}") == "y" ]; then
    MOFED_VER=4.7-1.0.0.1
fi

MOFED_DIR=MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}

export MOFED_VER=$MOFED_VER
export OS_VER=$OS_VER
export PLATFORM=$PLATFORM
export MOFED_DIR=$MOFED_DIR

bash install_MOFED.sh