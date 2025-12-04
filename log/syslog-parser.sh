#!/bin/bash
# NAS or router syslog can be forwarded to a central server via UDP 514, for example:
# https://kb.synology.com/zh-tw/DSM/help/LogCenter/logcenter_server?version=6
if grep "`date +%b\ %e\ %H`" /var/log/messages | grep user1; then echo "login found!";fi
# sshd log on mac could be found in /var/log/system.log
zgrep sshd /var/log/system.log.0.gz
# time stamps of dmesg in human readable format
# https://www.linuxquestions.org/questions/linux-newbie-8/the-numbers-in-dmesg-4175425742/
dmesg -T
FOLDER=/var/log
ls $FOLDER | while read LINE
do
echo ${LINE}: | sed -e 's/\(.*.*\)/\o033[1;36m\1\o033[39m/'
cat $FOLDER/$LINE | sed -e 's/\(.*sock.*\)/\o033[1;36m\1\o033[39m/'
#cat $FOLDER/$LINE 
done
# Logger in HPC System Administration https://www.admin-magazine.com/Articles/Logger-in-HPC-System-Administration
logger "Just a test"
logger -t myscript "A second test"
:'
syslog-ng uses the new logging format of the sudo tool to process sudo messages.
'
