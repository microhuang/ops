```
js cookie：
document.cookie="key1=val1; path=/; domain=.example.com; expires=Fri, 17 Jul 2015 03:52:04 GMT";

*1、多个cookie用"分号空格"分隔
document.cookie="key1=val1; key2=val2";

2、特殊字符使用escape()函数编码，使用unescape()函数解码
document.cookie="key1="+escape("val1");

3、设置过期时间
var expires = new Date();
expires.setTime(expires.getTime()+1*24*3600*1000);
document.cookie="key1=val1; expires="+expires.toGMTString();

4、设置路径
document.cookie="key1=val1; path=/";

5、设置域名
document.cookie="key1=val1; domain=.example.com";
```
