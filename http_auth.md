basic auth

digest auth
```
#ng
    auth_digest           "Password please";
    auth_digest_user_file /etc/nginx/htpasswd.digest;
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
    auth_digest_user_file /etc/nginx/htpasswd.digest;
    #auth_basic            "Password please";
    #auth_basic_user_file  /etc/nginx/htpasswd;

    location /{
        autoindex on;
        autoindex_localtime on;
        if ( -f $request_filename ) {
            return 404;
        }
    }
}
```
