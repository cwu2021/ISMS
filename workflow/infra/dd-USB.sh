#!/bin/ksh
# this method works for creating bootable USB from img (OpenBSD, FreeDOS) and iso (Ubuntu).
# https://www.openbsd.org/faq/faq4.html
dd if=install70.img of=/dev/rsd6c bs=1M
# https://www.proxmox.com/en/downloads/category/iso-images-pve
# https://pve.proxmox.com/wiki/Prepare_Installation_Media
dd bs=1M conv=fdatasync if=./proxmox-ve_*.iso of=/dev/XYZ
# https://nomadbsd.org/download.html
# uncompressed file larger than FAT can handle!
lzma -d nomadbsd-x.y.z.img.lzma
dd bs=1M if=nomadbsd-x.y.z.img of=/dev/sdX conv=fsync
# may not be bootable due to USB key or PC or filesystem layout ...
: '
tails.net for Live USB
 - N:$599, AC52:$799, AC1200:$1099. SDHC2USB:$168.
Rescue systems play a vital role for desktops because they cannot simply be reinstalled on the fly. We look at venerable but outdated Knoppix and three still in development: Grml, SystemRescue, and Finnix.
'