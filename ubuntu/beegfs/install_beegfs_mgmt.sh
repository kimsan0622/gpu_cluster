export BEEGFS_MGMT_ROOT=/data/beegfs/beegfs_mgmtd

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

# management service
apt install beegfs-mgmtd 

# set and run management service
/opt/beegfs/sbin/beegfs-setup-mgmtd -p ${BEEGFS_MGMT_ROOT}
systemctl start beegfs-mgmtd