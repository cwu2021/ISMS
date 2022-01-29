#!/bin/bash
# How To Enable SFTP Without Shell Access on Ubuntu 16.04
# https://www.digitalocean.com/community/tutorials/how-to-enable-sftp-without-shell-access-on-ubuntu-16-04
cat >> /etc/ssh/sshd_config << EOF
Match User sammyfiles
ForceCommand internal-sftp
PasswordAuthentication yes
ChrootDirectory /var/sftp
PermitTunnel no
AllowAgentForwarding no
AllowTcpForwarding no
X11Forwarding no
# sshd on ubuntu 20.04
#Legacy changes
KexAlgorithms +diffie-hellman-group1-sha1
Ciphers +aes128-cbc
EOF
