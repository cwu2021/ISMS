#!/bin/bash
# Disable Auto-adding of Network Printers: The solution is to disable the cups-browsed service: 
systemctl stop cups-browsed
systemctl disable cups-browsed
# http://7thzero.com/blog/how-to-stop-ubuntu-20-04-from-auto-adding-network-printers
systemctl stop cups
systemctl disable cups
# How To Fix System Program Problem Detected In Ubuntu
# The crash reports are stored in /var/crash directory in Ubuntu. If you look in to this directory, you should see some files ending with crash.
# https://itsfoss.com/how-to-fix-system-program-problem-detected-ubuntu/
# What is this folder /run/user/1000?
# /run/user/$uid is created by pam_systemd and used for storing files used by running processes for that user. These might be things such as your keyring daemon, pulseaudio, etc.
# https://unix.stackexchange.com/questions/162900/what-is-this-folder-run-user-1000
