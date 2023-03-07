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
