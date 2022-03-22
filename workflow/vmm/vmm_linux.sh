#!/bin/ksh
# https://github.com/skyformat99/vmm_setup/blob/master/Makefile

mkdir -p /VMs/linux
cd /VMs/linux && ftp -V https://nl.alpinelinux.org/alpine/v3.6/releases/x86_64/alpine-virt-3.6.0-x86_64.iso
# edit /etc/{pf,sysctl,dhcpd,vm}.conf
rcctl enable vmd && rcctl enable dhcpd && rcctl set dhcpd flags vether0
