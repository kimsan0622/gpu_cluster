#!/bin/bash

# management node ip
export MGMT_NODE_IP=192.168.0.114
export BEEGFS_MOUNT_POINT=/mnt/beegfs

# for jessie
beegfs_jessie_list=$"# If you have an active BeeGFS support contract, use the alternative URL below\n
# to retrieve early updates. Replace username/password with your account for\n
# the BeeGFS customer login area.\n
#deb [arch=amd64]  https://username:password@www.beegfs.io/login/release/beegfs_7_1 jessie non-free\n
deb [arch=amd64] https://www.beegfs.io/release/beegfs_7_1 jessie non-free"

# add package repositories to source.list.d
bash -c  'cat << EOF > /etc/apt/sources.list.d/beegfs.list
# If you have an active BeeGFS support contract, use the alternative URL below
# to retrieve early updates. Replace username/password with your account for
# the BeeGFS customer login area.
#deb [arch=amd64]  https://username:password@www.beegfs.io/login/release/beegfs_7_1 stretch non-free
deb [arch=amd64] https://www.beegfs.io/release/beegfs_7_1 stretch non-free
EOF'

# add the repository signature keys
wget -q https://www.beegfs.io/release/latest-stable/gpg/DEB-GPG-KEY-beegfs -O- | apt-key add -

# update package list
apt update

# install client library
apt install -y beegfs-client beegfs-helperd beegfs-utils

# support rdma
sed -i 's/buildArgs=-j8/buildArgs=-j8 BEEGFS_OPENTK_IBVERBS=1 OFED_INCLUDE_PATH=\/usr\/src\/ofa_kernel\/default\/include\//g' /etc/beegfs/beegfs-client-autobuild.conf

# rebuild client
/etc/init.d/beegfs-client rebuild

# setup client
/opt/beegfs/sbin/beegfs-setup-client -m ${MGMT_NODE_IP}

# setup mount point
mv /etc/beegfs/beegfs-mounts.conf /etc/beegfs/beegfs-mounts.conf.backup
bash -c  "cat << EOF > /etc/beegfs/beegfs-mounts.conf
${BEEGFS_MOUNT_POINT} /etc/beegfs/beegfs-client.conf
EOF"

# start beegfs client
systemctl start beegfs-helperd
systemctl start beegfs-client

# confirm
#beegfs-check-servers
#beegfs-net
