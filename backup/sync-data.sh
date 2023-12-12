#!/bin/bash
# 3-2-1 Backup plan with Fedora ARM server
# https://fedoramagazine.org/3-2-1-backup-plan-with-fedora-arm-server/

LANG=en_US

do
echo "`date` sync started..." >> sync.log
# estimate total sync time.
rsync -avz /folder1 /folder2/
# or sync remotely via ssh, cron at midnight, morning, aftrnoon, and such.
rsync -av user1@host1:/data/folder/ /local/folder/
# https://linuxize.com/post/how-to-exclude-files-and-directories-with-rsync/
rsync -av --exclude 'out/*' --exclude 'public/uploads/*' alldata/ partialdata/
# rsync from POSIX to FAT, -a to no -go.
rsync -rltpDvz posix/ fat/
done
echo "`date` sync ended..." >> sync.log

# report by mail via crontab. mailx package required.
#00 09  *  *  7 tail sync.log | mail -s "sync weekly" -S smtp=ip.of.mta webmaster@your.domain

# SFTP forwarding if required
# https://www.linuxjournal.com/content/sftp-port-forwarding-enabling-suppressed-functionality

# Migrating a Linux system to virtual machine with rsync
# https://letitknow.wordpress.com/2012/12/31/migrating-a-linux-system-to-virtual-machine-with-rsync/
# boot it with a live cd
sudo parted /dev/sda print
:'
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 34.4GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:
Number Start End Size File system Name Flags
 1 1049kB 2097kB 1049kB bios_grub
 2 2097kB 2150MB 2147MB ext4
 3 2150MB 34.4GB 32.2GB
'
# https://hugh712.gitbooks.io/grub/content/bios-installation.html
# https://unix.stackexchange.com/questions/542132/how-to-avoid-naming-of-partitions-with-parted
# (parted) mkpart "" 1049k 2097k

export RSYNC_PASSWORD=&ltrsync_password>\
rsync -vrtlpogDSH --progress --delete --exclude=/sys --exclude=/proc \
--delete-excluded <rsync_user>@<source_ip>::root/ /mnt/;\
mkdir /mnt/proc;mkdir /mnt/sys
