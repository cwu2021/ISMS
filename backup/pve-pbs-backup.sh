#!/bin/bash
# https://forum.proxmox.com/threads/proxmox-backup-server-on-lxc-with-external-nas.79489/
# Download Debian 10 (Buster) template
# Install a minimal Container (2 GB RAM, 8 GB HD) and then choose the container/Options/Features and then enable NFS.

# Do:
apt-get update
apt-get dist-upgrade

# Install the repo key
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

# Add PBS debian package repo to /etc/apt/sources.list
# deb http://ftp.debian.org/debian buster main contrib
# deb http://ftp.debian.org/debian buster-updates main contrib

# THIS IS THE NEW ADDITION
# PBS pbs-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
# deb http://download.proxmox.com/debian/pbs buster pbs-no-subscription

# security updates
# deb http://security.debian.org/debian-security buster/updates main contrib

# Install the PBS-server software
apt-get update
apt-get install proxmox-backup-server

# After a reboot all is installed and started, don't forget to set the IP-address you want to use
# and mounting the NFS-share you want to use as the storage for backups.
# Put the NFS-share into /etc/fstab to automatically mount it at reboot.
