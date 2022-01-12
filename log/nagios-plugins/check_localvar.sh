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
