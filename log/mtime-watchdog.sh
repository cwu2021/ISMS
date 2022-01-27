#!/bin/bash
# https://stackoverflow.com/questions/4774358/get-mtime-of-specific-file-using-bash

# define workflow here.
work_process=
watchfile=work_process.log

while true; do
echo "check time is: `date`"
filemtime=`stat -c %Y $watchfile`
currtime=`date +%s`
diff=$((currtime - filemtime))

#https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
# if the log didn't update over 3 secs, workflow may be stucked.
if [ $diff -ge 3 ]
then
killall $work_process
echo "`date '+%b %d %H:%M:%S'` $work_process restarted..." >> watchdog.log
fi
sleep 3
done
