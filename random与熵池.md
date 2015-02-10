```
linux系统随机数的相关知识：
1、linux系统中包含两类随机数生成器：/dev/random、/dev/urandom。各语言中的随机数函数均与其有关。
2、使用/dev/random生成随机数时依赖于“熵池”，熵池空，则随机数函数调用将组撒i；/dev/urandom则不会阻塞。
3、熵池实际上是从各种noice source中获取数据，noice source可能是 键盘事件、鼠标事件、设备时钟中等。
4、linux2.6内核废弃了一些noice source，所以相比2.4内核，熵池更容易发生不够用导致阻塞的情况。
5、使用watch cat /proc/sys/kernel/random/entropy_avail监控线上生成机器实际熵池基本维持在100-200之间一个很小的范围。
6、使用rngd命令可以补充熵池：rngd -r /dev/urandom -o /dev/random -f -t 1
7、centos系统可以后台服务运行rngd进程，确保熵池足够可用。需要配置/etc/sysconfig/rngd文件，“EXTRAOPTIONS="-r /dev/urandom"“。

两篇非常好的文章，共参考：
http://jarfield.iteye.com/blog/1739834
http://www.laruence.com/2012/09/24/2810.html

大量使用随机数的业务，可能需要关注熵池不足导致的调用阻塞。
```
