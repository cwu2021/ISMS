#!/bin/bash
# Delete journal logs older than X days: sudo journalctl --vacuum-time=2days.
#Delete log files until the disk space taken falls below the specified size:
sudo journalctl --vacuum-size=100M.
# https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjP1ImM6o73AhVmyosBHTBbA4QQFnoECAgQAw&url=https%3A%2F%2Fubuntuhandbook.org%2Findex.php%2F2020%2F12%2Fclear-systemd-journal-logs-ubuntu%2F&usg=AOvVaw3oBlAx0JLt2HLbXg3psGfr
# check journal logs and nftables rules for sshguard
# https://wiki.nftables.org/wiki-nftables/index.php/Simple_rule_management
journalctl -ef -t sshguard
nft list table sshguard
