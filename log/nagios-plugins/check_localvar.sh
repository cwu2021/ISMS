#!/bin/bash
# https://mathias-kettner.de/checkmk_localchecks.html
# Monitoring time-based processes (Cronjobs)
# https://docs.checkmk.com/latest/en/monitoring_jobs.html

myps=`your/local/exe`

    if [ $myps == your.result ] ; then
        status=0
        statustxt=OK
    else
        status=2
        statustxt=CRITICAL
    fi
    echo "$status localvar myps=$status;0;1;0; $statustxt - $myps result text"
    
myps=`/usr/local/bin/check_load -w 1,0.6,0.3 -c 2,1.2,0.6 | awk '{print $1}'`
myload=`/usr/local/bin/check_load -w 1,0.6,0.3 -c 2,1.2,0.6 | awk '{print $5}' | cut -d ',' -f1`

    if [ $myps != OK ] ; then
        status=1
        statustxt=WARNING
    else
        status=0
        statustxt=OK
    fi
    echo "$status myLoad myps=$myload;0.6;0.3;0; $statustxt - $myload server_load"
