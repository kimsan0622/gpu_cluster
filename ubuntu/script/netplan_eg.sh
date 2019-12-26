# set ib0 and ib1 interfaces
export MTU_SIZE=65520
export IB0_IP=192.168.0.134
export IB0_GATEWAY=10.0.0.1
export IB0_SUBNET_MASK=24
export IB1_IP=192.168.0.135
export IB1_SUBNET_MASK=24
export IB1_GATEWAY=10.0.0.1

# set netplan for ib0
bash set_netplan.sh exec ib00-netcfg ib0 $IB0_IP/$IB0_SUBNET_MASK $IB0_GATEWAY $MTU_SIZE
# set netplan for ib1
bash set_netplan.sh exec ib01-netcfg ib1 $IB1_IP/$IB1_SUBNET_MASK $IB1_GATEWAY $MTU_SIZE

# apply netplan
netplan apply