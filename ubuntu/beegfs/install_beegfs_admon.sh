export MGMT_NODE_IP=192.168.0.114

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

# admon service (optional)
apt install beegfs-admon

# set configuration and start admon service
sed -i "s/sysMgmtdHost                 =/sysMgmtdHost=${MGMT_NODE_IP}/g" /etc/beegfs/beegfs-admon.conf
systemctl start beegfs-admon

#To run the Admon GUI (the ##.jar## file can also be copied to other machines):
#$ java -jar /opt/beegfs/beegfs-admon-gui/beegfs-admon-gui.jar