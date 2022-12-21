#!/bin/bash
# Disable Auto-adding of Network Printers: The solution is to disable the cups-browsed service: 
systemctl stop cups-browsed
systemctl disable cups-browsed
# http://7thzero.com/blog/how-to-stop-ubuntu-20-04-from-auto-adding-network-printers
systemctl stop cups
systemctl disable cups
