#!/bin/bash

#export MOFED_VER=4.7-1.0.0.1
#export OS_VER=ubuntu18.04
#export PLATFORM=x86_64
#export MOFED_DIR=MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}

apt-get update
apt-get -y install apt-utils
apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends --fix-missing \
        build-essential cmake tcsh tcl tk \
        dpatch bison pkg-config \
        make git curl vim wget ca-certificates \
        iputils-ping net-tools ethtool \
        perl lsb-release python-libxml2 \
        iproute2 pciutils libnl-route-3-200 \
        kmod libnuma1 lsof openssh-server \
        swig libelf1 automake libglib2.0-0 \
        autoconf graphviz chrpath flex libnl-3-200 m4 \
        debhelper autotools-dev gfortran libgfortran3 quilt libltdl-dev

# Download and install Mellanox OFED 4.7-1.0.0.0 for Ubuntu 18.04
wget --quiet http://content.mellanox.com/ofed/MLNX_OFED-${MOFED_VER}/MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}.tgz && \
    tar -xvf MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}.tgz && \
    MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}/mlnxofedinstall --without-fw-update -q && \
    rm -rf ${MOFED_DIR} && \
    rm -rf ${MOFED_DIR}.tgz

# set LOAD_EIPOIB=yes
sed -i 's/LOAD_EIPOIB=no/LOAD_EIPOIB=yes/g' /etc/infiniband/openib.conf

# reload openib daemon
/etc/init.d/openibd restart

# ubuntu os and driver version match
# 4.7-1.0.0.1
#   14.04.06, 16.04.6, 18.04.2, 18.04.3, 19.4

# 4.6-1.0.1.1
#   14.04.05, 16.04.4, 18.04.1, 18.04.2

# 4.5-1.0.1.0
#   16.04.3, 16.04.4, 18.04, 18.04.1, 18.10

