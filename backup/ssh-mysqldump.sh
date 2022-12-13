#!/bin/bash
# https://stackoverflow.com/questions/40024280/mysqldump-via-ssh-to-local-computer
# https://code.yidas.com/mysqldump/
mysqldump --all-databases > backup/alldb-`date +%Y%m%d`.sql
ssh root@ipaddress "mysqldump -u dbuser -p dbname | gzip -9" > dblocal.sql.gz 
# purge bin log via mysql prompt
# > purge binary logs before '2021-09-01 23:59:59';
# mysqldump for remote db backup. https://stackoverflow.com/questions/19552150/how-to-backup-mysql-database-on-a-remote-server
mysqldump --host 192.168.1.15 -P 3306 -u dev -pmjQ9Y mydb > mydb.sql
