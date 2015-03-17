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
    root /var/www/http/;

    include /etc/nginx/date.var;
    access_log /var/log/nginx/idc.$date.log;
    error_log  /var/log/nginx/idc.error.log;

    auth_digest           "Password please";
    auth_digest_user_file /opt/molbase.inc/etc/nginx/htpasswd.digest;
    auth_digest_expires   30s;
    #auth_basic            "Password please";
    #auth_basic_user_file  /opt/molbase.inc/etc/nginx/htpasswd;

    location /{
        autoindex on;
        autoindex_localtime on;
        index xugouwenjianming.html;
#        if ( -f $request_filename/index.html ) {
#           add_header Content-Type "text/plain;charset=utf-8";
#           return 200 "index file exists";
#       }
        if ( -f $request_filename ) {
            return 403;
        }
    }
}
```
