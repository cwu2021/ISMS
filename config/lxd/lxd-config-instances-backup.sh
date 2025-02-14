#!/bin/bash
# Basic shell script to backup required LXD parts ##
## Backup and restore LXD config ##
## Today's date ##
NOW=$(date +'%m-%d-%Y')

## Dump LXD server config ##
lxd init --dump > "/backups/lxd/lxd.config.${NOW}"

## Dump all instances list ##
lxc list > "/backups/lxd/lxd.instances.list.${NOW}"

## Make sure we know LXD version too ##
snap list lxd > "/backups/lxd/lxd-version.${NOW}"

## Backup all Instances
for i in $(lxc list -c n --format csv)
do
     echo "Making backup of ${i} ..."
     lxc export "${i}" "/backups/lxd/${i}-backup-$(date +'%m-%d-%Y').tar.xz" --o
ptimized-storage
done
