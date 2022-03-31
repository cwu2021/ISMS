#!/bin/bash
# PostgreSQL basic administration.
docker run -it --name bionic ubuntu:18.04 /bin/bash
docker attach bionic
apt update;apt install postgresql
su - postgres
# psql to enter shell. \l show databases. create database newtest; \q exit.
pg_dump postgres > /tmp/test.dump
psql newtest < /tmp/test.dump
pg_dumpall > /tmp/all.dump
