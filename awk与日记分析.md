##### 两日记文件比较

```
awk -F' - ' 'BEGIN{ccc=0;cc=0}NR==FNR{a[$6]=$10;next}{if(a[$6]>0)ccc++;if(a[$6]>0&&a[$6]!=$10)cc++;}END{print "recorder:"ccc" difference:"cc;}' /tmp/131.log /tmp/132.log
recorder:477493 difference:4016
```
