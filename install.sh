#!/bin/bash
docker build . --tag=docker-njuvpn

username="190000000"
password="123456789"
vpnaddress="https://vpn.nju.edu.cn"

# socks5 port: 1080 
# http port: 8888
# start container
touch ~/.easyconn
docker run --name=NJUVPN --device /dev/net/tun --cap-add NET_ADMIN -ti \
    -p 0.0.0.0:1080:1080 \
    -p 0.0.0.0:8888:8888 \
    -e EC_VER=7.6.3 \
    -e CLI_OPTS="-d ${vpnaddress} -u ${username} -p ${password}" \
    docker-njuvpn:latest &