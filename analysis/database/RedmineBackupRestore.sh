# https://www.redmine.org/projects/redmine/wiki/RedmineBackupRestore
# Database
/usr/bin/mysqldump -u <username> -p<password> <redmine_database> | gzip > /path/to/backup/db/redmine_`date +%Y-%m-%d`.gz
# Attachments
rsync -a /path/to/redmine/files /path/to/backup/files
# Restoring a database¶
gunzip -c 2018-07-30.gz | mysql -u <username> --password <redmine_database>
pg_restore -U <username> -h <hostname> -d <redmine_database> redmine.sqlc
psql <redmine_database> < <infile>
# 管理MIS的鳥事-使用Redmine https://ithelp.ithome.com.tw/m/users/20151950/ironman/5450
