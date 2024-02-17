#!/bin/bash
# lvm resize after extending vm disk on ubuntu 18.04LTS:
# https://unix.stackexchange.com/questions/373063/auto-expand-last-partition-to-use-all-unallocated-space-using-parted-in-batch-m
sudo parted /dev/vda resizepart 3 100%
# https://serverfault.com/questions/378086/how-to-extend-a-linux-pv-partition-online-after-virtual-disk-growth
sudo pvresize /dev/vda3
# https://blog.moa.tw/2018/12/ubuntu-1804-root-lvm-volume.html
# https://access.redhat.com/documentation/zh-tw/red_hat_enterprise_linux/6/html/logical_volume_manager_administration/lv_extend
sudo lvresize -A n -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
# LVM creation before full rsync
# https://www.redhat.com/sysadmin/create-physical-volume
pvcreate /dev/sda3
pvs
# https://www.redhat.com/sysadmin/create-volume-group
vgcreate ubuntu-vg /dev/sda3
# https://www.linuxquestions.org/questions/linux-hardware-18/lvcreate-with-max-size-available-749253/
lvcreate -n ubuntu-lv -l 100%FREE ubuntu-vg
