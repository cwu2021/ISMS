#!/bin/bash
# set specified dataset for storage then quota.
zfs create web/myassets
# zfs destroy web/myassets
zfs set quota=500G web/myassets
# lxc.mount.entry: /web/myassets mnt/zfs none bind 0 0

# LXD Dir vs ZFS or BTRFS Performance
# https://discuss.linuxcontainers.org/t/lxd-dir-vs-zfs-or-btrfs-instance-performance/13328/1
# Filesystems — openmediavault 7.x.y documentation
# https://docs.openmediavault.org/en/latest/administration/storage/filesystems.html
