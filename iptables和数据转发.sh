#-A PREROUTING -s 197.34.188.163/32 -d 139.159.118.131/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination 139.159.118.136
# 将来源197.34.188.163/32到目的139.159.118.131/32的数据转发至139.159.118.136
iptables -t nat -A PREROUTING -s 197.34.188.163/32 -d 139.159.118.131/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination 139.159.118.136
