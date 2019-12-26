#!/bin/bash

# get_plan_script file_path interface_name interface_addr_CIDR gateway mtu_size
# e.g.) ret_val=$(get_plan_script /etc/netplan/ib00-netcfg.yaml ib0 192.163.0.134/8 10.0.0.1 65520)
# echo $ret_val
get_plan_script(){
    cmd_script="cat << EOF > $1
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        $2:
            addresses:
            - $3
            gateway4: $4
            nameservers:
                addresses:
                - 8.8.8.8
                search:
                - 8.8.8.8
            mtu: \"$5\"
    version: 2
EOF"
echo "$cmd_script"
}

# e.g.) sudo bash set_netplan.sh exec ib0_cfg ib0 192.163.0.134/8 10.0.0.1 65520

# e.g.) export NETPLAN_NAME="ib0_cfg" IF_NAME="ib0" IF_CIDR="192.163.0.134/8" GATEWAY="10.0.0.1" MTU_SIZE="65520"
#       sudo bash set_netplan.sh run

if [ "$1" == "run" ]; then
    arguments="/etc/netplan/${NETPLAN_NAME}.yaml ${IF_NAME} ${IF_CIDR} ${GATEWAY} ${MTU_SIZE}"
    ret_val=$( get_plan_script $arguments )
    bash -c "$ret_val"
elif [ "$1" == "exec" ]; then
    arguments="/etc/netplan/${2}.yaml ${3} ${4} ${5} ${6}"
    ret_val=$( get_plan_script $arguments )
    bash -c "$ret_val"
fi