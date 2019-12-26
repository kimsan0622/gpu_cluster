#!/bin/bash

apt-get update
apt-get -y install apt-utils
apt-get install dkms build-essential linux-headers-generic -y
apt-get install openjdk-8-jdk git build-essential python-virtualenv swig python-wheel libcupti-dev -y