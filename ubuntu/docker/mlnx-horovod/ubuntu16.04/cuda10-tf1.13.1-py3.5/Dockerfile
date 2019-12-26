# sudo docker build -t airc/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04 .
#REMOTE_REG_URL='10.0.0.161:5000'
#NODE_IP='10.0.0.134'
#sudo docker tag airc/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04 ${REMOTE_REG_URL}/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04
#sudo docker push ${REMOTE_REG_URL}/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04

#sudo docker -H ${NODE_IP}:2375 pull ${REMOTE_REG_URL}/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04
#sudo docker -H ${NODE_IP}:2375 run --runtime=nvidia -it --rm --network=host --privileged ${REMOTE_REG_URL}/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04

#sudo docker -H ${NODE_IP}:2375 run --runtime=nvidia -it --rm --network=infi_br0 --privileged ${REMOTE_REG_URL}/mlnx-horovod:10.0-cudnn7-devel-ubuntu16.04

#sudo docker -H ${NODE_IP}:2375 exec -it /bin/bash


# Local Horovod
#CUDA_VISIBLE_DEVICES='0' mpirun -np 1 -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True

# Horovod TCP + NCCL
#mpirun -np 2 -H hpc-b2:1,hpc-b3:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=1 -x HOROVOD_MPI_THREADS_DISABLE=0 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True

# Horovod IB + NCCL without GDR
#mpirun -np 2 -H hpc-b2:1,hpc-b3:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=0 -x HOROVOD_MPI_THREADS_DISABLE=1 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True

# Horovod IB + NCCL + GDR
#mpirun -np 2 -H hpc-b2:1,hpc-b3:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=1 -x HOROVOD_MPI_THREADS_DISABLE=1 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True




# Horovod TCP + NCCL
#mpirun -np 2 -H 10.0.0.134:1,10.0.0.137:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=1 -x HOROVOD_MPI_THREADS_DISABLE=0 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True

# Horovod IB + NCCL without GDR
#mpirun -np 2 -H 10.0.0.134:1,10.0.0.137:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=0 -x HOROVOD_MPI_THREADS_DISABLE=1 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True

# Horovod IB + NCCL + GDR
#mpirun -np 2 -H 10.0.0.134:1,10.0.0.137:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x NCCL_DEBUG=INFO -x NCCL_IB_DISABLE=0 -x NCCL_SOCKET_IFNAME=ib0 -x NCCL_IB_GDR_LEVEL=1 -x HOROVOD_MPI_THREADS_DISABLE=1 -x LD_LIBRARY_PATH -x PATH -mca pml ob1 -mca btl ^openib python3 /examples/benchmarks/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model resnet50 --batch_size 32 --use_fp16 --variable_update horovod --xla=True


# CPU test
#mpirun -np 2 -H 10.0.0.134:1,10.0.0.137:1 -mca plm_rsh_args "-p 22222" -bind-to none -map-by slot -x LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH -x PATH $(pwd)/hello




FROM nvidia/cuda:10.0-devel-ubuntu16.04
 
# TensorFlow version is tightly coupled to CUDA and cuDNN so it should be selected carefully
ENV TENSORFLOW_VERSION=1.13.1
ENV PYTORCH_VERSION=1.0.0
ENV CUDNN_VERSION=7.5.1.10-1+cuda10.0
ENV NCCL_VERSION=2.4.2-1+cuda10.0
ENV MXNET_URL=mxnet_cu100
 
# Set MOFED directory, image and working directory
ENV MOFED_DIR MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64
ENV MOFED_SITE_PLACE MLNX_OFED-4.5-1.0.1.0
ENV MOFED_IMAGE MLNX_OFED_LINUX-4.5-1.0.1.0-ubuntu16.04-x86_64.tgz
 
# Python 2.7 or 3.5 is supported by Ubuntu Xenial out of the box
ARG python=3.5
ENV PYTHON_VERSION=${python}
 
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        vim \
        wget \
        ca-certificates \
        iputils-ping \
        net-tools \
        ethtool \
        perl \
        lsb-release \
        iproute2 \
        pciutils \
        libnl-route-3-200 \
        kmod \
        libnuma1 \
        lsof \
        libcudnn7=${CUDNN_VERSION} \
        libnccl2=${NCCL_VERSION} \
        libnccl-dev=${NCCL_VERSION} \
        libjpeg-dev \
        libpng-dev \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-dev \
        gcc-4.8 g++-4.8 && \
        rm -rf /rm -rf /var/lib/apt/lists/*
 

# make gcc-4.8 and g++-4.8 as default compiler
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

RUN ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
 
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py
 
# Install TensorFlow, Keras, PyTorch and MXNet
# ERROR: mxnet-cu100 1.5.1.post0 has requirement numpy<2.0.0,>1.16.0, but you'll have numpy 1.14.6 which is incompatible.
# ERROR: torchvision 0.4.2 has requirement torch==1.3.1, but you'll have torch 1.0.0 which is incompatible.
RUN pip install 'numpy<1.15.0' tensorflow-gpu==${TENSORFLOW_VERSION} keras h5py torch==${PYTORCH_VERSION} torchvision ${MXNET_URL}
 
# Install Open MPI
RUN mkdir /tmp/openmpi && \
    cd /tmp/openmpi && \
    wget https://www.open-mpi.org/software/ompi/v4.0/downloads/openmpi-4.0.0.tar.gz && \
    tar zxf openmpi-4.0.0.tar.gz && \
    cd openmpi-4.0.0 && \
    ./configure --enable-orterun-prefix-by-default && \
    make -j $(nproc) all && \
    make install && \
    ldconfig && \
    rm -rf /tmp/openmpi

# Install Horovod, temporarily using CUDA stubs
RUN ldconfig /usr/local/cuda-10.0/targets/x86_64-linux/lib/stubs && \
    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_WITH_TENSORFLOW=1 HOROVOD_WITH_PYTORCH=1 HOROVOD_WITH_MXNET=1 pip install --no-cache-dir horovod && \
    ldconfig
 
# Create a wrapper for OpenMPI to allow running as root by default
RUN mv /usr/local/bin/mpirun /usr/local/bin/mpirun.real && \
    echo '#!/bin/bash' > /usr/local/bin/mpirun && \
    echo 'mpirun.real --allow-run-as-root "$@"' >> /usr/local/bin/mpirun && \
    chmod a+x /usr/local/bin/mpirun
 
# Configure OpenMPI to run good defaults:
RUN echo "hwloc_base_binding_policy = none" >> /usr/local/etc/openmpi-mca-params.conf && \
    echo "rmaps_base_mapping_policy = slot" >> /usr/local/etc/openmpi-mca-params.conf && \
    echo "btl_tcp_if_exclude = lo,docker0" >> /usr/local/etc/openmpi-mca-params.conf
 
# Download and install Mellanox OFED 4.5.1.0.1 for Ubuntu 16.04
RUN wget http://content.mellanox.com/ofed/${MOFED_SITE_PLACE}/${MOFED_IMAGE} && \
    tar -xzvf ${MOFED_IMAGE} && \
    ${MOFED_DIR}/mlnxofedinstall --user-space-only --without-fw-update --all -q && \
    cd .. && \
    rm -rf ${MOFED_DIR} && \
    rm -rf *.tgz
  
# Set default NCCL parameters
RUN echo NCCL_DEBUG=INFO >> /etc/nccl.conf
 
# Install OpenSSH for MPI to communicate between containers
RUN apt-get install -y --no-install-recommends openssh-client openssh-server && \
    mkdir -p /var/run/sshd
 
# Allow OpenSSH to talk to containers without asking for confirmation
RUN cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config
 
# Download examples
RUN apt-get install -y --no-install-recommends subversion && \
    svn checkout https://github.com/horovod/horovod/trunk/examples && \
    rm -rf /examples/.svn
WORKDIR "/examples"
 

# INF_IP_NUM=23
# docker network create --driver=bridge --subnet=172.16.${INF_IP_NUM}.0/24 --ip-range=172.16.${INF_IP_NUM}.0/24 --gateway=172.16.${INF_IP_NUM}.1 -o "com.docker.network.bridge.name"="infi_br0" -o "com.docker.network.bridge.enable_icc"="true" infi_br0

# sysctl net.ipv4.conf.all.forwarding
# sudo iptables -P FORWARD ACCEPT

# B2_IB_IP=192.168.0.134
# B3_IB_IP=192.168.0.137

# B2_DBRIDGE_IP=172.16.22.0/24
# B3_DBRIDGE_IP=172.16.23.0/24

# sudo ip route add 172.16.42.0/24 via 12.12.12.42
# sudo ip route add ${B2_DBRIDGE_IP} via ${B2_IB_IP}
# sudo ip route add ${B3_DBRIDGE_IP} via ${B3_IB_IP}


RUN mkdir -p /root/.ssh/ && \
    cat /etc/ssh/ssh_host_rsa_key >> /root/.ssh/id_rsa && \
    cat /etc/ssh/ssh_host_rsa_key.pub >> /root/.ssh/authorized_keys && \
    chmod 400 /root/.ssh/id_rsa && \
    echo "Host *" > /root/.ssh/config && \
    echo "  Port 22222" >> /root/.ssh/config && \
    sed -i 's/Port 22/Port 22222/g' /etc/ssh/sshd_config

# TF 1.13 benchmarks install and configure
RUN git clone https://github.com/tensorflow/benchmarks.git && \
    cd benchmarks/ && \
    git checkout cnn_tf_v1.13_compatible
WORKDIR "/examples/benchmarks"

ENTRYPOINT service ssh start