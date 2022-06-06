#!/bin/bash
# https://discuss.linuxcontainers.org/t/failures-on-installing-lxd-on-ubuntu20-04-and-systemctl-errors/11051 , works wel.
systemctl status snap.lxd.daemon
# If /dev/loop* are created by snaps, just remove the snaps that created them, using snap remove <name_of_snap> . You can get a list of your installed snaps by running snap list .2019年12月11日
# https://askubuntu.com/questions/1195388/how-to-remove-dev-loops
snap remove lxd
