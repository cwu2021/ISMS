#!/bin/bash
yum install epel-release
yum install sshguard
cp /usr/share/doc/sshguard-2.4.0/examples/sshguard.conf.sample /etc/sshguard.conf
#(then edit the required three parameters)
#https://www.unixmen.com/block-ssh-brute-force-attacks-using-sshguard/
chmod 755 /etc/rc.local
iptables -N sshguard
iptables -A INPUT -j sshguard
systemctl enable rc-local
