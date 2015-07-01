memcached -d -p 11211 -u memcached -m 64 -c 1024 -P /var/run/memcached/memcached.pid -vv >> /tmp/memcached.log 2>&1 &

# /etc/sysconfig/memcached
# OPTIONS="-vv > /tmp/memcached.log 2>&1"
