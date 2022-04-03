#!/bin/ksh
# this method works for creating bootable USB from img (OpenBSD, FreeDOS) and iso (Ubuntu).
# https://www.openbsd.org/faq/faq4.html
dd if=install70.img of=/dev/rsd6c bs=1M
# https://www.proxmox.com/en/downloads/category/iso-images-pve
# https://pve.proxmox.com/wiki/Prepare_Installation_Media
dd bs=1M conv=fdatasync if=./proxmox-ve_*.iso of=/dev/XYZ
