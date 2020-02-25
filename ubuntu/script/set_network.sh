
# macvlan
export SUBNET=10.0.0.0/8
export IPRANGE=10.1.0.0/16
export GW=10.0.0.1
export IF=enp96s0f0
export NETNAME=dockernet

docker network create -d macvlan \
  --subnet=$SUBNET \
  --ip-range=$IPRANGE \
  --gateway=$GW \
  -o parent=$IF $NETNAME

docker network create -d macvlan \
  --subnet=10.0.0.0/8 \
  --ip-range=10.1.0.0/16 \
  --gateway=10.0.0.1 \
  -o parent=enp96s0f0 dockernet


# bridge
docker network create \
  --driver=bridge \
  --subnet=172.16.182.0/24 \
  --ip-range=172.16.182.0/24 \
  --gateway=172.16.182.1 \
  infi_br0
  


# configure ip tables
sudo iptables -P FORWARD ACCEPT
sudo ip route add 172.16.182.0/24 via 192.168.0.182
sudo ip route add 172.16.188.0/24 via 192.168.0.188

