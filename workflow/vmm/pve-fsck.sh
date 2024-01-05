#!/bin/bash
# EXT4-fs error (device dm-2): ext4_journal_check_start:56: 
# Detected aborted journal
# EXT4-fs (dm-2): Remounting filesystem read-only
qm stop <ALL RUNNING VM>
# if not stopping kvm first, /dev/mapper/pve-data is in use
umount -l /var/lib/vz
e2fsck -yf /dev/dm-2
mount -a
