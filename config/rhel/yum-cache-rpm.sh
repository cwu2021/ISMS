#!/bin/bash
# yum cache as local rpm repo.
# Where are the rpm files after installation using yum? - Super User
# https://superuser.com/questions/171302/where-are-the-rpm-files-after-installation-using-yum
ls /var/cache/yum
# in /etc/yum.conf , set keepcache=1 .
