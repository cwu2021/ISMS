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
: '
 - Celebrating 20 Years of Proxmox! https://forum.proxmox.com/threads/celebrating-20-years-of-proxmox.165655/
 - Proxmox Virtual Environment 8.4 https://forum.proxmox.com/threads/proxmox-ve-8-4-released.164821/
 - Proxmox Virtual Environment 9.0 with Debian 13 released
 - Beta release: Proxmox Datacenter Manager
 - Proxmox Virtual Environment 9.1 available
Proxmox Virtual Environment was first released back in April 2008. The popular virtualization management platform has a huge worldwide user base with 1.6 million hosts. The GUI is available in over 31 languages. Proxmox has tens of thousand of customers in over 142 countries from companies regardless of size, sector or industry.
 - Proxmox Datacenter Manager in stable version 1.0 available
 - Proxmox Backup Server 4.2 released
 - Proxmox Virtual Environment 9.2 available
Dynamic Load Balancer for the Cluster Resource Scheduler. Expanded SDN stack with WireGuard and BGP as new Fabric protocols. Fine-grained BGP/EVPN filtering with route maps and prefix lists. Management of custom CPU models from the web interface. New "Disarm and Arm" workflow for planned HA cluster maintenance. Based on Debian 13.5 “Trixie” with Linux kernel 7.0 as the new stable default. Updated core technologies including QEMU 11.0, LXC 7.0, and ZFS 2.4. Ceph Tentacle 20.2.
 - Proxmox Datacenter Manager 1.1 released
 - Proxmox Mail Gateway 9.1 released
'