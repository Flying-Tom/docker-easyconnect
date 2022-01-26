#!/bin/bash

[ -n "$CHECK_SYSTEM_ONLY" ] && detect-tun.sh
detect-iptables.sh
. "$(which detect-route.sh)"
[ -n "$CHECK_SYSTEM_ONLY" ] && exit

open_port 1080
open_port 8888

interface_name="eth0"

# 如果是 podman 容器，interface 名称为 tap0 而不是 eth0
if [[ -n "$container" && "$container" == "podman" ]]; then
	interface_name="tap0"
fi

iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

# 拒绝 tun0 侧主动请求的连接.
iptables -I INPUT -p tcp -j DROP
iptables -I INPUT -i $interface_name -p tcp -j ACCEPT
iptables -I INPUT -i lo -p tcp -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# 删除深信服可能生成的一条 iptables 规则，防止其丢弃传出到宿主机的连接
# 感谢 @stingshen https://github.com/Hagb/docker-easyconnect/issues/6
# ( while true; do sleep 5 ; iptables -D SANGFOR_VIRTUAL -j DROP 2>/dev/null ; done )&

if [ -n "$_EC_CLI" ]; then
	ln -s /usr/share/sangfor/EasyConnect/resources/{conf_${EC_VER},conf}
	exec start-sangfor.sh
fi

[ -n "$EXIT" ] && MAX_RETRY=0

# 登录信息持久化处理
## 持久化配置文件夹 感谢 @hexid26 https://github.com/Hagb/docker-easyconnect/issues/21
[ -d ~/conf ] || cp -a /usr/share/sangfor/EasyConnect/resources/conf_backup ~/conf
[ -e ~/easy_connect.json ] && mv ~/easy_connect.json ~/conf/easy_connect.json # 向下兼容
## 默认使用英语：感谢 @forest0 https://github.com/Hagb/docker-easyconnect/issues/2#issuecomment-658205504
[ -e ~/conf/easy_connect.json ] || echo '{"language": "en_US"}' > ~/conf/easy_connect.json

rm -rf /tmp
mkdir /tmp

exec start-sangfor.sh