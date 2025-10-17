#!/bin/bash
# linux - How to Free Inode Usage? - Stack Overflow
# https://stackoverflow.com/questions/653096/how-to-free-inode-usage
df -i
# ext4 cannot do data scrubing. btrfs may be needed for extra protection features. but QNAP has different opinion.
# https://www.synology.com/zh-tw/dsm/Btrfs
# https://www.qnap.com/solution/qnap-ext4/zh-tw/
# https://kb.synology.com/en-global/DSM/tutorial/Which_file_system_should_I_use_to_create_a_volume
# Btrfs with its CoW design tends to perform slower in the database tests than others, but these days when running multiple SQLite tests concurrently it is fairing much better than in the past.2021年8月27日
#  Because of that, the Ext4 filesystem is very stable. The Ext4 filesystem is still the default filesystem in many popular Linux distributions (i.e. Ubuntu/Debian). If you need to store some data as an ordinary Linux user, you can keep your eyes closed and use the Ext4 filesystem.
# HDD compatibility list is important. Otherwise 'Unverified'.
# https://www.synology.com/en-global/compatibility?search_by=products&model=DS2422%2B&category=hdds_no_ssd_trim&p=1&change_log_p=1
"'
Bcachefs, a next-generation Linux filesystem, merges into the kernel, offering a feature-complete, high-performance copy-on-write design for scalable, reliable storage.
'