#!/bin/bash
# The LXD Project Finds a New Home at Canonical
# https://news.itsfoss.com/canonical-lxd-project/
# https://documentation.ubuntu.com/lxd/en/latest/tutorial/first_steps/
snap list
# lxd may be built-in for ubuntu > 23.04
lxd init --minimal
lxc launch images:centos/7 first
# centos images may require cgroup v1.
lxc list
# If this is your first time running LXD on this machine, you should also run: lxd init
# To start your first instance, try: lxc launch ubuntu:20.04
lxc export
# https://www.team-bob.org/lxd_backup_and_migrate/
# Canonical's Leading LXD Engineer Quits
# https://www.omgubuntu.co.uk/2023/07/canonicals-loses-prominent-lxd-engineer
# Stéphane Graber has left Canonical
# https://news.ycombinator.com/item?id=36666920