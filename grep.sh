# grep zgrep 

#在全部gz文件中查找字符串，并输出所在文件名
for i in `ls /tmp/*.gz`;do zgrep "zh/supplier-29997_product-21719265.html" $i&&echo $i;done

#
find /tmp/ -name "*.xml.gz" -exec zgrep "en/cas-registry-number_8-1065.html" {} \;

#
#从文件内容中进行分离
#提取分离条件 －－ 去头、取第一列
awk -F"," 'NR>1{print $1}' /tmp/userIds.txt > /tmp/userIdList.txt
#只处理特定日期
for f in `find /tmp/upfile/ -name Info_*.csv | grep -E "20161001|20161002|20161003|20161004|20161005|20161006"`;
do
    #分离只包含特定ID的内容，-t命令打印、-i占位符{}替换
    cat /tmp/userIdList.txt | xargs -t -i grep -r '",{},"' $f > $f.true
    #制作副本
    cp $f $f.tmp
    #从副本中删除特定ID的内容
    cat /tmp/userIdList.txt | xargs -i sed -i '/,{},/d' $f.tmp
    #删除后的内容保存
    cp $f.tmp $f.false
done
