##### 两日记文件比较

```
awk -F' - ' 'BEGIN{ccc=0;cc=0}NR==FNR{a[$6]=$10;next}{if(a[$6]>0)ccc++;if(a[$6]>0&&a[$6]!=$10)cc++;}END{print "recorder:"ccc" difference:"cc;}' /tmp/131.log /tmp/132.log
recorder:477493 difference:4016
```

##### 二维数组？
```
#!/bin/bash

awk 'BEGIN{
   print "ordered";
   for(i=1; i<=3; i++){
       for(j=1; j<=3; j++){
           array[i, j] = i * j;
           print i" * "j" = "array[i,j];
       }
   }

   print

   #print array[3,3];

   print "unordered";

   for(i in array){                      #for in循环无序访问
       split(i, array2, SUBSEP);         #使用 SUBSEP "\034" 分隔数组下标
       print array2[1]" * "array2[2]" = " array[i];
   }
}'
```
