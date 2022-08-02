#!/bin/bash
# https://mathias-kettner.de/checkmk_localchecks.html

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

    if [ $myps != OK ] ; then
        status=1
        statustxt=WARNING
    else
        status=0
        statustxt=OK
    fi
    echo "$status myLoad myps=1.0;0.6;0.3;0; $statustxt - server_load"
