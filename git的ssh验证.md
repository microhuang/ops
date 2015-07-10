```
ssh -v 参数可以debug验证执行过程，发现文件加载路径。

windows平台git.exe工具可能从其安装目录.ssh寻找ssh验证文件，
windows平台sh.exe工具可能从其系统账号.ssh寻找ssh验证文件，
windows平台TortoiseGit工具可依赖pageant.exe加载putty验证文件，或在仓库配置中指定putty验证文件路径。
```
