#!/bin/bash
# The LXD Project Finds a New Home at Canonical
# https://news.itsfoss.com/canonical-lxd-project/
# https://documentation.ubuntu.com/lxd/en/latest/tutorial/first_steps/
snap list
# lxd may be built-in for ubuntu > 23.04
lxd init --minimal
lxc launch images:centos/7 first
head -15 /etc/default/grub
# LXD 5 requires downgrading to cgroups v1 to run old instances. e.g. centos!
# GRUB_CMDLINE_LINUX_DEFAULT="systemd.unified_cgroup_hierarchy=false"
# https://blog.davy.tw/posts/enable-cgroups-v2-in-ubuntu/
# https://askubuntu.com/questions/1165399/why-maybe-ubiquity-on-default-kernel-command-line
mount | grep cgroup
# KVM hypervisor: a beginners’ guide | Ubuntu
# https://ubuntu.com/blog/kvm-hyphervisor
lxc list
# If this is your first time running LXD on this machine, you should also run: lxd init
# To start your first instance, try: lxc launch ubuntu:20.04
lxc export
# https://www.team-bob.org/lxd_backup_and_migrate/
# Canonical's Leading LXD Engineer Quits
# https://www.omgubuntu.co.uk/2023/07/canonicals-loses-prominent-lxd-engineer
# Stéphane Graber has left Canonical
# https://news.ycombinator.com/item?id=36666920
