#!/bin/bash
# https://stackoverflow.com/questions/40024280/mysqldump-via-ssh-to-local-computer
# https://code.yidas.com/mysqldump/
mysqldump --all-databases > backup/alldb-`date +%Y%m%d`.sql
rm -rf backup/alldb-`date -d '-7days' +%Y%m%d`.sql
ssh root@ipaddress "mysqldump -u dbuser -p dbname | gzip -9" > dblocal.sql.gz 
# purge bin log via mysql prompt
# > purge binary logs before '2021-09-01 23:59:59';
# mysqldump for remote db backup. https://stackoverflow.com/questions/19552150/how-to-backup-mysql-database-on-a-remote-server
mysqldump --host 192.168.1.15 -P 3306 -u dev -pmjQ9Y mydb > mydb.sql
# Oracle Utilities Pocket Reference: A Quick Reference for DBAs and Developers - Sanjay Mishra - Google Books
# https://books.google.com/books/about/Oracle_Utilities_Pocket_Reference.html?id=D2WMC5XjoWYC
# Knoppix Pocket Reference - Kyle Rankin - Google Books
# https://books.google.com/books/about/Knoppix_Pocket_Reference.html?id=Lp_KAgAAQBAJ
# jQuery Pocket Reference: Read Less, Learn More - David Flanagan - Google Books
# https://books.google.com/books/about/jQuery_Pocket_Reference.html?id=bgyODwAAQBAJ
