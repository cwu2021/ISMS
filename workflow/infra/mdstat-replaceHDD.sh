#!/bin/bash
# https://vault.centos.org/6.10/os/i386/Packages/
rpm -ivh mailx-12.4-8.el6_6.i686.rpm
rpm -ivh smartmontools-5.43-3.el6.i686.rpm
rpm -ivh hdparm-9.43-4.el6.i686.rpm
smartctl -a /dev/sda
smartctl -a /dev/sdb
# LED blinking the HDD array as HDD slot reference.
hdparm -tT /dev/sda
# https://www.ichiayi.com/tech/softraid
cat /proc/mdstat
mdadm /dev/md0 --remove /dev/sdb
mdadm /dev/md0 --add /dev/sdb
