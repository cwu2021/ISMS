#!/bin/bash
# NAS or router syslog can be forwarded to a central server via UDP 514, for example:
# https://kb.synology.com/zh-tw/DSM/help/LogCenter/logcenter_server?version=6
if grep "`date +%b\ %e\ %H`" /var/log/messages | grep user1; then echo "login found!";fi
