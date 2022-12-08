#!/bin/bash
# https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/
sudo systemctl status ufw
sudo ufw allow ssh
sudo ufw allow 1194/udp comment 'OpenVPN server'
# OUTPUT block by default with iptables.
# :OUTPUT DROP [0:0]
# -A OUTPUT -d whitelisted.ip -j ACCEPT
# COMMIT
