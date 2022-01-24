#!/bin/bash
zpool status
# wwn-xxxxx  UNAVAIL
# prepare your notes of HDD SN and wwn list.
smartctl -a /dev/sdx
# Smartctl open device: /dev/sdx failed: No such device
smartctl -a /dev/sdy | more
# Device Model:     YYYYYY-XXXXX
# Serial Number:    SNSNSNSNSN
# LU WWN Device Id: 0abcdabcd
# User Capacity:    2,000,398,934,016 bytes [2.00 TB]
# Sector Size:      512 bytes logical/physical
# Rotation Rate:    7200 rpm
# LED blinking the HDD array as HDD slot reference.
hdparm -tT /dev/sdy
# Offline the disk, if necessary, with the zpool offline command.
# https://docs.oracle.com/cd/E19253-01/819-5461/gazgd/index.html
ls -l /dev/by-id/
zpool replace -f yourpool /dev/by-id/wwm=xxxxx /dev/by-id/wwm=olddisk /dev/by-id/wwm=newdisk
# reslivering will be started. HDD can be hotswapped. 
