#http://wiki.ubuntu.org.cn/IptablesHowTo

#清空
# iptables -P INPUT ACCEPT
# iptables -F

#允许已经建立的连接
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#开放ssh端口
iptables -A INPUT -p tcp -i ens3 --dport ssh -j ACCEPT
#开放80端口
iptables -A INPUT -p tcp -i ens3 --dport 80 -j ACCEPT
#开放443端口
iptables -A INPUT -p tcp -i ens3 --dport 443 -j ACCEPT
#开放8080
iptables -A INPUT -p tcp -i ens3 --dport 8080 -j ACCEPT
#允许回环
iptables -A INPUT -i lo -j ACCEPT
#记录
iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
#拒绝所有
iptables -A INPUT -j DROP

#查看
# iptables -L -v

#保存
# iptables-save > /etc/iptables/up.rules

#系统配置
# vi /etc/network/interfaces
# auto lo
# iface lo inet loopback
# source /etc/network/interfaces.d/*.cfg

#网络启用时ip规则
# pre-up iptables-restore < /etc/iptables/up.rules
# post-down iptables-save > /etc/iptables/up.rules
#网络关闭时ip规则
# post-down iptables-restore < /etc/iptables/down.rules




