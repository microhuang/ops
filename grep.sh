# grep zgrep 

#在全部gz文件中查找字符串，并输出所在文件名
for i in `ls /tmp/*.gz`;do zgrep "zh/supplier-29997_product-21719265.html" $i&&echo $i;done

#
find /tmp/ -name "*.xml.gz" -exec zgrep "en/cas-registry-number_8-1065.html" {} \;
