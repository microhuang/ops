lvdisplay                                                      #查看逻辑卷
lvcreate -l 10 -s -n lv_home-snapshot /dev/VolGroup/lv_home    #创建逻辑卷快照
mkdir /mnt/snapshot_home
mount /dev/VolGroup/lv_home-snapshot /mnt/snapshot_home/       #绑定快照
                                                               #，使用、备份快照中的数据
umount /mnt/snapshot_home/                                     #卸载卷
lvremove /dev/VolGroup/lv_home-sn                              #删除卷。快照使用写时复制(COW)，如果不尽快删除卷，将在较长的时间内增加系统IO压力。
