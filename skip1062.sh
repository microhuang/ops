#!/bin/sh

MYSQL="mysql -h 127.0.0.1 -P 3307 -e"

lastPos=0
while [ 1 ]; do
        $MYSQL "show slave status\G" > /tmp/.skip
        lastError=`cat /tmp/.skip|grep "Last_SQL_Errno"|awk '{print $2}'`
        nowPos=`cat /tmp/.skip|grep "Exec_Master_Log_Pos"|awk '{print $2}'`
        if [ $lastError -eq 1062 ]; then
                if [ $lastPos -ne $nowPos ]; then
                        echo "blocked, skip one"
                        $MYSQL "stop slave; SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; start slave;"
                        lastPos=$nowPos
                else
                        echo "sleep one second"
                        sleep 1
                fi
        elif [ $lastError -eq 0 ]; then
                secondsBehind=`cat /tmp/.skip|grep "Seconds_Behind_Master"|awk '{print $2}'`
                if [ $secondsBehind -eq 0 ]; then
                        echo "done"
                        break
                else
                        echo "$secondsBehind seconds behind server"
                        sleep 3
                fi
        else
                echo "error $lastError found"
                break
        fi
done
