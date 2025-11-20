#!/bin/bash
# Steps to import qemu VM in LXD
# https://discuss.linuxcontainers.org/t/steps-to-import-qemu-vm-in-lxd/13299
# syslog > modified cpu set for lxc
pct list
# https://forum.proxmox.com/threads/syslog-modified-cpu-set-for-lxc.52979/
# You can use this option to further limit assigned CPU time. Please note that this is a floating point number, so it is perfectly valid to assign two cores to a container, but restrict overall CPU consumption to half a core.
# cores: 2
# cpulimit: 0.5
man vzdump
man pct
# install old pve via kvm on new pve host, then restore the old lxc archive.
# Storage across the network with iSCSI and Synology DiskStation Manager https://www.admin-magazine.com/Archive/2024/84/Storage-across-the-network-with-iSCSI-and-Synology-DiskStation-Manager
# Automating deployments on Proxmox with OpenTofu and cloud-init https://www.admin-magazine.com/Archive/2024/84/Automating-deployments-on-Proxmox-with-OpenTofu-and-cloud-init
:'
 - Celebrating 20 Years of Proxmox! https://forum.proxmox.com/threads/celebrating-20-years-of-proxmox.165655/
 - Proxmox Virtual Environment 8.4 https://forum.proxmox.com/threads/proxmox-ve-8-4-released.164821/
 - Proxmox Virtual Environment 9.0 with Debian 13 released
 - Beta release: Proxmox Datacenter Manager
 - Proxmox Virtual Environment 9.1 available
'