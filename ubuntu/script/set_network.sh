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
