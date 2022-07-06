#!/bin/bash
# Configuring static routes for vmkernel ports on an ESXi host (2001426)
# https://kb.vmware.com/s/article/2001426
esxcli network ip route ipv4 list
esxcli network ip route ipv4 add --gateway 192.168.0.1 --network 192.168.100.0/24
