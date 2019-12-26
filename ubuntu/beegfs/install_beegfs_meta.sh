export BEEGFS_META_ROOT=/data/beegfs/beegfs_meta

export MGMT_NODE_IP=192.168.0.114
export SERVICE_ID=2

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

# metadata service; libbeegfs-ib is only required for RDMA
apt install beegfs-meta libbeegfs-ib

# set and run metadata service
/opt/beegfs/sbin/beegfs-setup-meta -p ${BEEGFS_META_ROOT} -s ${SERVICE_ID} -m ${MGMT_NODE_IP}
systemctl start beegfs-meta