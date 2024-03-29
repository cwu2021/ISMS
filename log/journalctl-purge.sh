#!/bin/bash
# Delete journal logs older than X days:
sudo journalctl --vacuum-time=2d
# Vacuuming done, freed 895.7M of archived journals from /var/log/journal/3acc037fe00849caa68a572f6534a2bd.
# https://unix.stackexchange.com/questions/139513/how-to-clear-journalctl
# Delete log files until the disk space taken falls below the specified size:
sudo journalctl --vacuum-size=100M.
# https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjP1ImM6o73AhVmyosBHTBbA4QQFnoECAgQAw&url=https%3A%2F%2Fubuntuhandbook.org%2Findex.php%2F2020%2F12%2Fclear-systemd-journal-logs-ubuntu%2F&usg=AOvVaw3oBlAx0JLt2HLbXg3psGfr
# check journal logs and nftables rules for sshguard
# https://wiki.nftables.org/wiki-nftables/index.php/Simple_rule_management
journalctl -ef -t sshguard
nft list table sshguard
# more tips to go https://www.loggly.com/ultimate-guide/using-journalctl/?_ga=2.105914827.912215606.1677205102-1305855358.1677205102
journalctl -n 50 --since "1 hour ago"
# MySQL replication binlog purge
 cat > /tmp/purgebin.sql << EOF
 purge binary logs before '`date +%Y`-`date +%m`-01 23:59:59';
EOF
# mysql < /tmp/purgebin.sql
