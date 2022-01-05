#!/bin/bash

LANG=en_US

do
echo "`date` sync started..." >> sync.log
# estimate total sync time.
rsync -avz /folder1 /folder2/
done
echo "`date` sync ended..." >> sync.log
