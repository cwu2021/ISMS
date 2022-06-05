#!/bin/bash
# https://docs.openstack.org/image-guide/convert-images.html
qemu-img convert -f vmdk -O qcow2 image.vmdk image.qcow2
# - converted from vmdk to qcow2. raw better on zfs.
# - replace hdd in dir storage. writeback on zfs.
# - all NIC tied on internal vmbr.
# - move hdd to zfs storage as an option.
# https://forum.proxmox.com/threads/create-vm-from-existing-qcow2-image.33331/
# https://forum.proxmox.com/threads/new-virutal-machine-will-not-start.44889/
