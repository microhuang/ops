#/etc/iproute2/rt_tables
#252 net2
#251 net1
#shell
ip route flush table net1
ip route add default via 192.168.8.1 dev em1 src 192.168.81.232 table net1
#ip route add 127.0.0.0/8 dev lo table net1
ip rule add from 192.168.81.232 table net1
ip route flush table net2
ip route add default via 192.168.101.254 dev em2 src 192.168.101.66 table net2
#ip route add 127.0.0.0/8 dev lo table net2
ip rule add from 192.168.101.66 table net2
ip rule show
