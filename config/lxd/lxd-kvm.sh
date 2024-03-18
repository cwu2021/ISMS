#!/bin/bash
instance=freebsd
install=/home/user/app/FreeBSD-14.0-RELEASE-amd64-mini-memstick.img
# ISOs aren't easy to boot successfully!
# https://discuss.linuxcontainers.org/t/install-any-os-via-iso-in-a-virtual-machine-vm/9281/6
# https://cdimage.ubuntu.com/ubuntu-mini-iso/daily-live/current/
# wget https://ftp.openbsd.org/pub/OpenBSD/7.3/amd64/install73.img

# https://tobhe.de/stuff/lxd-openbsd.html
lxc init $instance --empty --vm -c limits.cpu=2 -c limits.memory=256MiB -c migration.stateful=true -c security.secureboot=false
lxc config device override $instance root size=10GiB size.state=4GiB
lxc config device add $instance install disk source=$install boot.priority=10
#lxc start $instance --console=vga
lxc start $instance --console
# lxc config device remove $instance install
# lxc stop $instance -f
# lxc delete $instance

# openbsd com0 notes: 
# ctrl-a q to escape from console
# boot> set tty com0
# boot> boot
# https://documentation.ubuntu.com/lxd/en/latest/reference/devices/
# https://documentation.ubuntu.com/lxd/en/stable-5.0/reference/standard_devices/
# Change the default console to com0? [yes]
# Available speeds are: 9600 19200 38400 57600 115200.
# Which speed should com0 use? (or 'done') [9600] 115200

# https://ubuntu.com/blog/lxd-virtual-machines-an-overview
##lxc launch ubuntu:22.04 ubuntu --vm
##lxc shell ubuntu
# LXD vga console with virt or spice installed. virt may be better.
##lxc console ubuntu --type=vga
