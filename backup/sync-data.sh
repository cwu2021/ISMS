#!/bin/bash

LANG=en_US

do
echo "`date` sync started..." >> sync.log
# estimate total sync time.
rsync -avz /folder1 /folder2/
# or sync remotely via ssh, cron at midnight, morning, aftrnoon, and such.
rsync -av user1@host1:/data/folder/ /local/folder/
done
echo "`date` sync ended..." >> sync.log
