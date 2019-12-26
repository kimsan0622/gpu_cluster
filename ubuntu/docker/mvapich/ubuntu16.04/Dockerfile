# sudo docker build -t airc/mvapich2-gdr:10.1-cudnn7-devel-ubuntu16.04 .

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

# cuda version
ENV CUDA_VERSION=10.1

# Set MOFED version, OS version and platform
ENV MOFED_VER 4.5-1.0.1.0
ENV OS_VER ubuntu16.04
ENV PLATFORM x86_64

ENV MOFED_DIR MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential cmake tcsh tcl tk \
        dpatch bison pkg-config \
        make git curl vim wget ca-certificates \
        iputils-ping net-tools ethtool \
        perl lsb-release python-libxml2 \
        iproute2 pciutils libnl-route-3-200 \
        kmod libnuma1 lsof openssh-server \
        swig libelf1 automake libglib2.0-0 \
        autoconf graphviz chrpath flex libnl-3-200 m4 \
        debhelper autotools-dev gfortran libltdl-dev \
        check libsubunit0 libsubunit-dev numactl \
        devscripts lintian gcc-4.8 g++-4.8

# make gcc-4.8 and g++-4.8 as default compiler
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

# Download and install Mellanox OFED 4.5-1.0.1.0 for Ubuntu 16.04
RUN wget --quiet http://content.mellanox.com/ofed/MLNX_OFED-${MOFED_VER}/MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}.tgz && \
    tar -xvf MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}.tgz && \
    MLNX_OFED_LINUX-${MOFED_VER}-${OS_VER}-${PLATFORM}/mlnxofedinstall --user-space-only --without-fw-update -q && \
    rm -rf ${MOFED_DIR} && \
    rm -rf *.tgz

#http://content.mellanox.com/ofed/MLNX_OFED-4.5-1.0.1.0/MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64.tgz 
# Allow OpenSSH to talk to containers without asking for confirmation
RUN cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

# install mlnx HPC-X
RUN cd /root && \
    wget http://www.mellanox.com/downloads/hpc/hpc-x/v2.5/hpcx-v2.5.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64.tbz && \
    tar xjf hpcx-v2.5.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64.tbz && \
    cd hpcx-v2.5.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64 && \
    rm -rf hpcx-v2.5.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64.tbz

# set HPCX_HOME
ENV HPCX_HOME /root/hpcx-v2.5.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64


# install nccl
RUN cd /tmp && \
    wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb && \
    dpkg -i nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb && \
    apt update && \
    rm -rf nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb && \
    apt install libnccl2=2.5.6-1+cuda${CUDA_VERSION} libnccl-dev=2.5.6-1+cuda${CUDA_VERSION}

# install nv_peer_mem
RUN cd /tmp && \
    git clone https://github.com/Mellanox/nv_peer_memory.git && \
    cd nv_peer_memory && \
    ./build_module.sh && \
    tar xzf /tmp/nvidia-peer-memory_1.0.orig.tar.gz && \
    cd /tmp/nvidia-peer-memory-1.0 && \
    dpkg-buildpackage -us -uc && \
    dpkg -i /tmp/nvidia-peer-memory_1.0-8_all.deb && \
    dpkg -i /tmp/nvidia-peer-memory-dkms_1.0-8_all.deb && \
    rm -rf /tmp/*

# install gdrcopy
RUN cd /tmp && \
    git clone https://github.com/NVIDIA/gdrcopy.git && \
    cd gdrcopy/packages && \
    CUDA=/usr/local/cuda ./build-deb-packages.sh && \
    dpkg -i gdrdrv-dkms_2.0_amd64.deb && \
    dpkg -i gdrcopy_2.0_amd64.deb && \
    rm -rf /tmp/*


# install mvapich2-gdr
# wget http://mvapich.cse.ohio-state.edu/download/mvapich/gdr/2.3.2/mofed4.5/mvapich2-gdr-mcast.cuda10.1.mofed4.5.gnu4.8.5.slurm-2.3.2-1.el7.centos.x86_64.rpm

