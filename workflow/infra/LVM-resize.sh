#!/bin/bash
# lvm resize after extending vm disk on ubuntu 18.04LTS:
# https://unix.stackexchange.com/questions/373063/auto-expand-last-partition-to-use-all-unallocated-space-using-parted-in-batch-m
sudo parted /dev/vda resizepart 3 100%
# https://serverfault.com/questions/378086/how-to-extend-a-linux-pv-partition-online-after-virtual-disk-growth
sudo pvresize /dev/vda3
# https://blog.moa.tw/2018/12/ubuntu-1804-root-lvm-volume.html
sudo lvresize -A n -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
