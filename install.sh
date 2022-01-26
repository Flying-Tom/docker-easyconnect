#!/bin/bash

# 构建容器
docker build . --tag=docker-easyconnss

# 参数设置
username="190000000"
password="123456789"
vpnaddress="https://vpn.easyconnect.com.cn"

# 启动容器
touch ~/.easyconn
docker run --name=easyconnss --device /dev/net/tun --cap-add NET_ADMIN -ti \
    -p 0.0.0.0:1080:1080 \
    -p 0.0.0.0:8888:8888 \
    -e EC_VER=7.6.3 \
    -e CLI_OPTS="-d ${vpnaddress} -u ${username} -p ${password}" \
    docker-easyconnss:latest
