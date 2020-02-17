export BEEGFS_STORAGE_ROOT=/mnt/myraid1/beegfs_storage

export MGMT_NODE_IP=192.168.0.114
export SERVICE_ID=3
export STORAGE_TARGET_ID=301

# add package repositories to source.list.d
bash -c  'cat << EOF > /etc/apt/sources.list.d/beegfs.list
# If you have an active BeeGFS support contract, use the alternative URL below
# to retrieve early updates. Replace username/password with your account for
# the BeeGFS customer login area.
#deb [arch=amd64]  https://username:password@www.beegfs.io/login/release/beegfs_7_1 stretch non-free
deb [arch=amd64] https://www.beegfs.io/release/beegfs_7_1 stretch non-free
EOF'

# update package list
apt update

# add the repository signature keys
wget -q https://www.beegfs.io/release/latest-stable/gpg/DEB-GPG-KEY-beegfs -O- | apt-key add -

# storage service; libbeegfs-ib is only required for RDMA
apt install -y beegfs-storage libbeegfs-ib

# run storage service
/opt/beegfs/sbin/beegfs-setup-storage -p ${BEEGFS_STORAGE_ROOT} -s ${SERVICE_ID} -i ${STORAGE_TARGET_ID} -m ${MGMT_NODE_IP}
systemctl start beegfs-storage
