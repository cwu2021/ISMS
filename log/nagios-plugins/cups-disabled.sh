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
