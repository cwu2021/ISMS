#!/bin/bash
# NAS or router syslog can be forwarded to a central server via UDP 514, for example:
# https://kb.synology.com/zh-tw/DSM/help/LogCenter/logcenter_server?version=6
if grep "`date +%b\ %e\ %H`" /var/log/messages | grep user1; then echo "login found!";fi
# sshd log on mac could be found in /var/log/system.log
zgrep sshd /var/log/system.log.0.gz
# time stamps of dmesg in human readable format
# https://www.linuxquestions.org/questions/linux-newbie-8/the-numbers-in-dmesg-4175425742/
dmesg -T
