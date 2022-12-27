#!/bin/ksh
# https://bsdly.blogspot.com/2022/12/can-your-spam-eater-manage-to-catch.html
zgrep "Nov  1" /var/log/spamd.6.gz | grep -c disconnected
zgrep "Nov  1" /var/log/spamd.6.gz | grep -c BLACK
zgrep "Nov  1" /var/log/spamd.6.gz | grep -c GREY
zgrep "Nov  1" /var/log/spamd.6.gz | grep -c whitelisting
doas zgrep 2022-11-02 /var/spool/exim/logs/main.log.6.gz | grep -c Completed
doas zgrep 2022-11-02 /var/spool/exim/logs/main.log.6.gz | grep -c rejected
doas zgrep 2022-11-02 /var/spool/exim/logs/main.log.6.gz | grep -c unexpected
