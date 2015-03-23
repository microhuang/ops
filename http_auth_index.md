basic auth

digest auth
```
#ng
    auth_digest           "Password please";
    auth_digest_user_file /etc/nginx/htpasswd.digest;
    auth_digest_expires   30s;
```
autoindex
```
     location /{
        autoindex on;
        autoindex_localtime on;
        index xugouwenjianming_211b5f6b-8dcb-421b-8a55-c6cbeda8a4c3_index.html;
#        if ( -f $request_filename/index.html ) {
#           add_header Content-Type "text/plain;charset=utf-8";
#           return 200 "index file exists";
#       }
        if ( -f $request_filename ) {
            return 403;
        }
    }
```
```
cat /etc/nginx/htpasswd.digest
admin:Password please:cf36ee2d45938910f16bfa1704a53f20
```
```
echo "admin:Password please:`echo -n "admin:Password please:admin888"|md5sum|cut -b -32`" > /etc/nginx/htpasswd.digest
```

demo
```
server {
    listen 80;
    server_name idc.localhost.dev;
    
    root /var/www/http/;                  #若无root指令，可能报告：testing "/etc/nginx/html" existence failed (2: No such file or directory) while logging request
                                            #root默认值html，加上--prefix=/etc/nginx，构成/etc/nginx/html。

    include /etc/nginx/date.var;
    access_log /var/log/nginx/idc.$date.log;
    error_log  /var/log/nginx/idc.error.log;

    auth_digest           "Password please";
    auth_digest_user_file /etc/nginx/htpasswd.digest;
    auth_digest_expires   30s;
    #auth_basic            "Password please";
    #auth_basic_user_file  /etc/nginx/htpasswd;

    location /{
        autoindex on;
        autoindex_localtime on;
#       add_header Content-Type "text/plain;charset=utf-8";
#       return 200 "index file exists";   #-f前的值不包括index文件名
        index xugouwenjianming.html;      #避免默认文件存在致使( -f $request_filename )判断错误
#        if ( -f $request_filename/index.html ) {
#           add_header Content-Type "text/plain;charset=utf-8";
#           return 200 "index file exists";
#       }
        if ( -f $request_filename ) {      #-f -d -e -x由rewrite模块处理
#           add_header Content-Type "text/plain;charset=utf-8";
#           return 200 "index file exists";  #-f后的值包括了index文件名
            return 403;
        }
    }
}
```

module顺序
```
autoindex
index
rewrite
    -f、-d、-e、-x属于rewrite模块，执行此指令时index已经执行过，所以会导致request_file的变化，但在此之前，比如autoindex阶段，则request_file是不会附加index信息的。
```
