# Not Your Dad's Database - Postgres
# http://www.linux-magazine.com/Issues/2024/283/PostgreSQL
apt install postgresql
su - postgres
# roles may need to be created by createuserfirst!
createdb mydatabase
pg_restore -d mydatabase mydatabase.dump
psql
# \c mydatabase
# \dt (show tables, or)
# SELECT * FROM pg_catalog.pg_tables;
