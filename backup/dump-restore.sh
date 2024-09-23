#!/bin/bash
# dump/restore suite
# How to backup and restore a whole Red Hat Enterprise Linux system with the dump/restore commands?
# https://access.redhat.com/solutions/17525
dump -0u -f - /dev/sda1 | ssh root@remoteserver.example.com dd of=/tmp/sda1.dump

# https://www.linux-magazine.com/Issues/2022/261/Hot-Backups
# Proof of Concept script tested under Devuan. Fault tolerance code
# excluded for the sake of brevity. Not to be used in production.

# Stop the services which use the folders we want to backup.

/etc/init.d/apache2 stop
/etc/init.d/mysql stop

# Instruct the Operating System to commit pending write instructions to
# the hard drive.

/bin/sync

# Backup using Tar and send the data over to a remote host via ssh
# Public key SSH authentication must be configured beforehand if this
# script is to be run unattended.

/bin/tar --numeric-owner -cf - /var/www /var/mariadb 2 >>
/dev/null | ssh debug@someuser@example.org "cat - > backup_`date -I`.tar"

# Restart services
# serverfault/mysql-server-error-1042-hy000-cant-get-hostname
# [mysqld]
# skip-name-resolve
/etc/init.d/mysql start
/etc/init.d/apache2 start

