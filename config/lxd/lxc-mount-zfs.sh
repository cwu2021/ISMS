#!/bin/bash
# set specified dataset for storage then quota.
zfs create web/myassets
# zfs destroy web/myassets
zfs set quota=500G web/myassets
# lxc.mount.entry: /web/myassets mnt/zfs none bind 0 0
