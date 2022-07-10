#!/bin/bash
# docker run -it --name nagios3 ubuntu:16.04
apt update
apt install nagios
apt install net-tools
netstat -tan
/etc/init.d/nagios3 start
/etc/init.d/apache2 start
dpkg-reconfigure postfix
/etc/init.d/postfix start
echo "test alert" | mail -s 'nagios test' youe@email
apt install vim -y
vi /etc/nagios3/conf.d/contacts_nagios2.cfg
