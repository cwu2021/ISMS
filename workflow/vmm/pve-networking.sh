#!/bin/bash
# https://pve.proxmox.com/wiki/Network_Configuration
# Network configuration can be done either via the GUI, or by manually editing the file /etc/network/interfaces, which contains the whole network configuration. 
# Once the network is configured, you can use the Debian traditional tools ifup and ifdown commands to bring interfaces up and down.
# Proxmox VE does not write changes directly to /etc/network/interfaces. Instead, we write into a temporary file called /etc/network/interfaces.new, this way you can do many related changes at once. This also allows to ensure your changes are correct before applying, as a wrong network configuration may render a node inaccessible.
ifup vmbr2
# if vma import failed, it may be due to storage name/type change.
vma extract  
# get conf and disk images. then move to ZFS. cmd via GUI is : 
/usr/bin/qemu-img convert -p -n -t none -f raw -O raw /vic1/pve/images/202/vm-202-disk-0.raw zeroinit:/dev/zvol/vic1/vmdisk/vm-202-disk-0
