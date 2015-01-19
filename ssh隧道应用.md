##### 动态端口转发/socket代理
###### 通过指定的本地端口，按本地应用的协议，经由远程服务转发出去。只要有个境外主机，这样给浏览器翻墙最简单哦。

```
ssh -D <local port> <SSH Server>
ssh -D 127.0.0.1:8080 139.159.118.130                 #通过本地8080端口的数据经由139.159.118.130，转发出去
```

##### 本地端口转发
###### 将一个远程端口经由ssh隧道机器映射为本地端口。应用访问此本地端口就等同与访问远程端口。

```
ssh -L <local port>:<remote host>:<remote port> <SSH hostname>
ssh -L 5901:192.168.2.101:5900 root@192.168.2.100     #通过本地5901端口的数据经由192.168.2.100转发给192.168.2.101:5900
```

##### 远程端口转发
###### 反向端口映射。

```
ssh -R <local port>:<remote host>:<remote port> <SSH hostname>
ssh -R 5900:192.168.2.100:5901 root@192.168.2.100   #访问远程192.168.2.100:5901端口的数据经由192.168.2.100转发给本地5900服务
```

##### 禁止端口转发

_cat /etc/ssh/sshd_config_

```
AllowTcpForwarding no
```

##### 共享端口转发
###### 运行远程主机使用上线转发端口（默认是不允许的）
```
-g
```

##### X协议转发

```
export DISPLAY=<X Server IP>:<display #>.<virtual #>
export DISPLAY=myDesktop:1.0                              #指定后续运行X应用界面在myDesktop主机显示
```

```
ssh -X <SSH Server>                                       #通过ssh隧道转发X协议到ssh server机器
```
