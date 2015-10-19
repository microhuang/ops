通常利用 ssh 连接远程服务器，一般都要输入以下类似命令：


ssh user@hostname -p port
如果拥有多个 ssh 账号，特别是像我这种喜欢在终端里直接 ssh 登陆，不用 PuTTY、SecureCRT 之类的 ssh 客户端的，要记住每个ssh 账号的参数，那是多么蛋疼的事情。

还好，ssh 提供一种优雅且灵活的方式来解决这个问题，就是利用 ssh 的用户配置文件 config 管理 ssh 会话。ssh 的用户配置文件是放在当前用户根目录下的 .ssh 文件夹里（~/.ssh/config，不存在则新创建一个），其配置写法如下：

```
Host    别名
    HostName        主机名
    Port            端口
    User            用户名
    IdentityFile    密钥文件的路径
有了这些配置，就可以这样用 ssh 登陆服务器了：
```

ssh 别名
