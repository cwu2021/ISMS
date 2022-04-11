#!/bin/bash
# https://askubuntu.com/questions/332315/how-to-read-and-write-hfs-journaled-external-hdd-in-ubuntu-without-access-to-os
# First, make sure that you have hfsprogs installed.
sudo apt-get install hfsprogs
# Next, mount or remount the HFS+ drive; commands need to be as follows:
sudo mount -t hfsplus -o force,rw /dev/sdXY /media/mntpoint
# or
sudo mount -t hfsplus -o remount,force,rw /mount/point
# Finally, if the drive has become partially corrupted run fsck.hfsplus ...
sudo fsck.hfsplus -f /dev/sdXY
