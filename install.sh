#!/bin/bash
docker build . --tag=docker-easyconnss

username="190000000"
password="123456789"
vpnaddress="https://vpn.easyconnect.com.cn"

# socks5 端口为1080
# http 端口为8888
# EC_VER为EasyConnect的版本号
# 启动容器
touch ~/.easyconn
docker run --name=easyconnss --device /dev/net/tun --cap-add NET_ADMIN -ti \
    -p 0.0.0.0:1080:1080 \
    -p 0.0.0.0:8888:8888 \
    -e EC_VER=7.6.3 \
    -e CLI_OPTS="-d ${vpnaddress} -u ${username} -p ${password}" \
    docker-easyconnss:latest &
