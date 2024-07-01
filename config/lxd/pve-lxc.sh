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
