#!/bin/bash
# https://stackoverflow.com/questions/40024280/mysqldump-via-ssh-to-local-computer
mysqldump --all-databases > backup/alldb-`date +%Y%m%d`.sql
ssh root@ipaddress "mysqldump -u dbuser -p dbname | gzip -9" > dblocal.sql.gz 
