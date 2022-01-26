# docker-easyconnect[NJU]

Fork自原项目，将EasyConnect封装在Docker容器中，开放socks5端口和http端口以使用代理

该分支在原项目的基础上，仅保留了CLI版本，主要添加了shadowsocks以实现代理的加密功能，可以将容器托管在服务器上向公网开放

shadowsocks的配置文件在`docker-root/etc/shadowsocks-libev`目录下，密码等参数如有需要请自行修改



## 使用方法

1. 修改项目根目录下`install.sh`中的`username`, `password`和`vpnaddress`变量

2. 执行`bash install.sh`

具体的设置和参数请参见原项目

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
