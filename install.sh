#!/bin/bash
# Athor ipchy@live.it
# Just for ubuntu & debian system
# Just for openvz
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
set -e
# update system
apt update && apt upgrade -y
# install dependencies
apt install git libnet1-dev libpcap0.8-dev -y
apt-get clean all
# install net-speeder
cd /usr/local
git clone https://github.com/ipchy/net-speeder.git
cd net-speeder
/bin/sh build.sh -DCOOKED
nohup /usr/local/net-speeder/net_speeder venet0 "ip" &
