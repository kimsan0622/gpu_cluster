#!/bin/bash

# remove old docker packages (if exist) and update package list
apt-get remove docker docker-engine docker.io containerd runc
apt-get update

# install packages for docker
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add key for docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

# add repository for docker
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# install nvidia runtime
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update && apt-get install -y nvidia-container-toolkit
systemctl restart docker

# expose remote access
cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.backup
sed -i 's/ExecStart=\/usr\/bin\/dockerd -H fd:\/\/ --containerd=\/run\/containerd\/containerd.sock/ExecStart=\/usr\/bin\/dockerd -H fd:\/\/ -H tcp:\/\/0\.0\.0\.0:2375/g' /lib/systemd/system/docker.service

# set nvidia runtime as default runtime
cp /etc/docker/daemon.json /etc/docker/daemon.json.backup
bash -c 'cat << EOF > /etc/docker/daemon.json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF'
