basic auth

digest auth
```
#ng
    auth_digest           "Password please";
    auth_digest_user_file /etc/nginx/htpasswd.digest;
```
```
cat /opt/molbase.inc/etc/nginx/htpasswd.digest
admin:Password please:cf36ee2d45938910f16bfa1704a53f20
```
```
echo "admin:Password please:`echo -n "admin:Password please:admin888"|md5sum|cut -b -32`" > /etc/nginx/htpasswd.digest
```
