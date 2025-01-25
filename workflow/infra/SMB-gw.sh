#!/bin/bash
# scan for older SMB shares.
smbclient -U $myuser -W $mydomain -L $myserver
# mount shares with then serve as SMB gateway.
#mount.cifs ... -o vers=1.0,...
mount.cifs //<ip>/<share> /<mount> -i user=<username>,pass=<password>,iocharset=utf8,rw
# read only, guest options set in /etc/samba/smb.conf.
# https://askubuntu.com/questions/867243/what-is-warning-syslog-option-is-deprecated
# https://forums.centos.org/viewtopic.php?t=58013
# syslog = 0 in [global] to disable logging, e.g. printer errs 
