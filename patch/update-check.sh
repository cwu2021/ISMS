#!/bin/bash
# https://mathias-kettner.de/checkmk_localchecks.html

cd $workdir
rm Release-Notes.txt
wget https://vendor.url/Release-Notes.txt 2>/dev/null
diff Release-Notes.txt Release-Notes.txt.old > /dev/null
if [ $? == 1 ] ; then
        status=1
        statustxt=WARNING
    echo "$status tcupdate myps=$status;0;1;0; $statustxt - update available"
    else
        status=0
        statustxt=OK
    echo "$status tcupdate myps=$status;0;1;0; $statustxt - no updates"
    fi
