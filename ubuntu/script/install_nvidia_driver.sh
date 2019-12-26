#!/bin/bash

apt-get install -y apt-transport-https curl
cat <<EOF | sudo tee /etc/apt/sources.list.d/cuda.list > /dev/null
deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /
EOF

# download and add key
curl -s \
 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub \
 | sudo apt-key add -

cat <<EOF | sudo tee /etc/apt/preferences.d/cuda > /dev/null
Package: *
Pin: origin developer.download.nvidia.com
Pin-Priority: 600
EOF

# install cuda drivers
apt-get update && sudo apt-get install -y --no-install-recommends cuda-drivers
reboot

# confirm
# nvidia-smi