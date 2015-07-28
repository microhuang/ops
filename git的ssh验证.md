```
ssh -v 参数可以debug验证执行过程，发现文件加载路径。

windows平台git.exe工具可能从其安装目录(C:\Program Files (x86)\Git\).ssh寻找ssh验证文件，
windows平台sh.exe工具可能从其系统账号.ssh寻找ssh验证文件，
windows平台TortoiseGit工具通过配置"SSH client"决定使用(ssh.exe)验证或者使用(TortoiseGitPlink.exe)验证。putty验证可依赖pageant.exe加载putty验证文件，或在仓库配置中指定putty验证文件路径。
```

```
git-pretty

http://blog.2baxb.me/wp-content/uploads/2014/09/git-pretty.dot_.png
```
