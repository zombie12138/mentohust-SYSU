#!/bin/sh

LOG_PATH=/var/log/ruijie/log
MAX_LOG_SIZE=1024000
LOG_SIZE=0
start_sysu() {
    echo [`date`]:\ \ \ Starting sysu >> $LOG_PATH
    /usr/local/bin/mentohust
}

stop_sysu() {
    echo [`date`]:\ \ \ Closing sysu >> $LOG_PATH
    /usr/local/bin/mentohust -k
    # kill -9 `ps | grep mentohust | grep -v grep | awk '{print $1}'`  > /dev/null 2>&1 &
}

restart_sysu() {
    stop_sysu
    start_sysu
}
mkdir /var/log/ruijie  > /dev/null 2>&1 &
while [ 1 ]
do
    LOG_SIZE=`ls -l $LOG_PATH | awk '{print $5}'` > /dev/null 2>&1
    if [ ! $LOG_SIZE -o $? -ne 0 ]; then
        LOG_SIZE=0
    fi
    if [ $LOG_SIZE -gt $MAX_LOG_SIZE ]; then
        rm $LOG_PATH
    fi
    # ping a dns server
    ping 202.96.128.166 -w 1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        sleep 5
        # recheck
        ping 202.96.128.166 -w 1 > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo [`date`]:\ \ \ Restarting sysu >> $LOG_PATH
            restart_sysu
            # sleep 10
            sleep 5
        fi
    fi
    sleep 5
done