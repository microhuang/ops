# 稀疏检出

*取代svn update(在git1.7+)*

### 准备

>$ git init <project>

>$ cd <project>

>$ git remote add origin <repository's url>

### 启用稀疏检出

>$ git config core.sparsecheckout true

### 设置检出目录

>$ echo "path1/" >> .git/info/sparse-checkout

>$ echo "path2/" >> .git/info/sparse-checkout

### 执行检出

>$ git pull origin master
