#!/bin/bash
#  https://www.redhat.com/sysadmin/backup-Restic?sc_cid=7013a000002piSoAAI 
# Wireless File Sharing https://www.linux-magazine.com/Issues/2025/291/LocalSend
# Compressed Archives for User Projects https://www.admin-magazine.com/Articles/Compressed-Archives-for-User-Projects/

set -e
source /etc/restic/b2.env
export CURRENT_DATE=$(date +%m_%d_%y_%H_%M_%S)

restic -r b2:my-repo:/backup --exclude-file=/etc/restic/excludes.txt --verbose backup /home/tony > "/tmp/backup_$CURRENT_DATE" 2>&1
restic -r b2:my-repo:/backup snapshots | tail -n 4 | head -n 2 | cut -f 1 -d ' ' | xargs restic -r b2:my-repo:/backup diff >> "/tmp/backup_$CURRENT_DATE" 2>&1

mail -s "Backup Report $CURRENT_DATE" email@example.com < "/tmp/backup_$CURRENT_DATE"
curl -s https://<redacted>

rm "/tmp/backup_$CURRENT_DATE"
