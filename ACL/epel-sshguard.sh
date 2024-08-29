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
# 監控惡意行為並呼叫防火牆阻斷來源 自建開源碼網路攻擊阻擋系統 | 網管人
#https://www.netadmin.com.tw/netadmin/zh-tw/technology/2FDCEED9F879437BAA6292D509A7C2FC
iptables -I INPUT -j sshguard
# the above may need to apply manually on ubuntu or docker hosts, in which iptables may be altered..
# ssh Brute Force » Linux Magazine http://www.linux-magazine.com/Issues/2024/282/Attacking-SSH