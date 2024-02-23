#!/bin/bash
# https://ubuntu.com/blog/lxd-virtual-machines-an-overview
lxc launch ubuntu:22.04 ubuntu --vm
lxc shell ubuntu
# LXD vga console with virt or spice installed. virt may be better.
lxc console ubuntu --type=vga
# https://tobhe.de/stuff/lxd-openbsd.html
lxc init openbsd --empty --vm -c limits.cpu=4 -c limits.memory=4GiB -c migration.stateful=true -c security.secureboot=false
lxc config device override openbsd root size=20GiB size.state=4GiB
wget https://ftp.openbsd.org/pub/OpenBSD/7.3/amd64/install73.img
lxc config device add openbsd install disk source=/home/user/install73.img boot.priority=10
lxc start openbsd --console
# ctrl-a q to escape from console
# boot> set tty com0
# boot> boot
# https://documentation.ubuntu.com/lxd/en/latest/reference/devices/
# https://documentation.ubuntu.com/lxd/en/stable-5.0/reference/standard_devices/
# Change the default console to com0? [yes]
# Available speeds are: 9600 19200 38400 57600 115200.
# Which speed should com0 use? (or 'done') [9600] 115200
lxc config device remove openbsd install
