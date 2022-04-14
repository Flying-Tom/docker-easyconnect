# docker-easyconnect[shadowsocks]

[![Build Docker Image Test](https://github.com/Flying-Tom/docker-easyconnect/actions/workflows/build.yml/badge.svg)](https://github.com/Flying-Tom/docker-easyconnect/actions/workflows/build.yml)

> 让深信服开发的非自由的 EasyConnect 代理软件运行在 docker 中，并开放 Socks5 供宿主机连接以使用代理。

该分支为原项目[Hagb/docker-easyconnect](https://github.com/Hagb/docker-easyconnect)的CLI版本添加了shadowsocks实现代理转发，使得面向公网开放代理端口的容器更为安全

## 使用方法

1. 安装Docker并运行 ([Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/))

2. 安装Docker-Compose, 其中`docker-compose.yaml`中的参数可自行修改

- `EC_VER` 为EasyConnect的版本号 [ 7.6.3 | 7.6.7 ]
- socks5端口为1080, http端口为8888

3. 在`~/.bashrc`里添加如下的环境变量

- `EASYCONN_USERNAME` 为Easyconnect用户名
- `EASYCONN_PASSWORD` 为Easyconnect密码
- `EASYCONN_VPNURL` 为vpn地址
- `EASYCONN_TESTURL` 为一个内网地址，用来测试容器是否连通

> 如果是在服务器上部署，请确保您已在服务商控制台打开了socks5/http端口

3. shadowsocks的配置文件在`docker-root/etc/shadowsocks-libev`目录下，**请修改相应的参数**(如密码等敏感参数)

更为具体的设置和参数请参见原项目[Hagb/docker-easyconnect](https://github.com/Hagb/docker-easyconnect)

## 改动

1. 仅保留了CLI版本，同时因为使用了shadowsocks-libev所以移去了容器内的dante-server和tinyproxy

2. 因为原来repo中的Dockerfile.cli是将命令行版客户端deb包放在容器内进行的，所以本地构建可能会遇到一些网络问题，因而我将该deb包放在了`CLI`文件夹下方便本地构建

> 基于 EasyConnect 官方“Linux”版的 deb 包以及 [@shmille](https://github.com/shmilee) 提供的[命令行版客户端 deb 包](https://github.com/shmilee/scripts/releases/download/v0.0.1/easyconn_7.6.8.2-ubuntu_amd64.deb)。

## 版权及许可证

保留了原项目的许可证(等于没有保留)

> Copyright © 2020 contributors
>
> This work is free. You can redistribute it and/or modify it under the  
> terms of the Do What The Fuck You Want To Public License, Version 2,  
> as published by Sam Hocevar. See the COPYING file for more details. 
>
>        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE  
>                    Version 2, December 2004  
>
> Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>  
>
> Everyone is permitted to copy and distribute verbatim or modified  
> copies of this license document, and changing it is allowed as long  
> as the name is changed.  
>  
>            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE  
>   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION  
>  
>  0. You just DO WHAT THE FUCK YOU WANT TO. 
