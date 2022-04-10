#!/bin/bash
# scan for older SMB shares.
smbclient -U $myuser -W $mydomain -L $myserver
# mount shares with then serve as SMB gateway.
mount.cifs ... -o vers=1.0,...
# read only, guest options set in /etc/samba/smb.conf.
