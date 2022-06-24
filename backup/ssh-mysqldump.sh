#!/bin/bash
# https://stackoverflow.com/questions/40024280/mysqldump-via-ssh-to-local-computer
ssh root@ipaddress "mysqldump -u dbuser -p dbname | gzip -9" > dblocal.sql.gz 
