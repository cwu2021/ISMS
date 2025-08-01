#!/bin/bash
# VBoxManage convert from raw ...
# c:\program files\oracle\virtualbox\
# openwrt.org/docs/guide-user/network/network_configuration

# dart language for OpenWRT Manager app dev
service firewall stop
# OpenWRT access from WAN customized rules
cat /etc/config/firewall
# fw3_config_set for ip list blocking. geoip for country blocking.
opkg update
opkg install htop
# OpenWRT opkg for speedtest and temper.py. neofetch can run directly via bash.
opkg list-installed
opkg list | grep speedtest
opkg install dmidecode
opkg install python3-pyserial
# install package manager on asus router - Unix & Linux Stack Exchange
# https://unix.stackexchange.com/questions/219605/install-package-manager-on-asus-router
# [OpenWrt Wiki] Write shell scripts in OpenWrt https://openwrt.org/docs/guide-developer/write-shell-script
# https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
: <<'END'
Cisco SF300-48 replaced with EOS(72)
about switch ASIC:
https://community.cisco.com/t5/switching/about-asic-in-switches/td-p/695272
reddit: Open source firmware for switches - HW & SW
No such thing as an open source switching OS... The problem with open sourcing a switching OS is the licensing terms for the Broadcom API: How the ASIC works, and how to talk to it are secrets.

A hub does not need an ASIC because it is not buffering frames, making a decision, and switching the frame out of the correct port. A hub simply is a repeater with a bunch of ports. It regenerates the actual signal on the wire.

A switch is a layer 2 device that makes a decision based on the layer 2 frame destination MAC address. The more ports you add to a switch the more processing a switch is doing. Just a few ports can be handled by software written to run on an off-the-shelf CPU. As the number of switch ports increase, the general purpose CPU using software solution can't keep up. The ASIC is basically a CPU that is not a general purpose CPU but is a CPU for making switching decisions very quickly. It can't be used for much else. This is similar to a high-end graphics card that has a special CPU for graphics processing that wouldn't be good for general applications. Hence the name, Application Specific Integrated Circuit

arista vEOS (registration required)
www.aristanetworks.com/en/support/download
vs switchd on cumuluslinux of NVidia
https://docs.nvidia.com/networking-ethernet-software/cumulus-linux-41/System-Configuration/Configuring-switchd/
vs xpenology for dsm 5/6.

5 open source alternatives to Minecraft: Minetest, etc.
opensource.com/alternative/minecraft
minetest.net/downloads

Granting Access to UniFi - Roles and Permissions – Ubiquiti Help Center
 - https://help.ui.com/hc/en-us/articles/1500011491541-Granting-Access-to-UniFi-Roles-and-Permissions
connecting switches on different controllers | Ubiquiti Community
 - https://community.ui.com/questions/connecting-switches-on-different-controllers/26329716-b7b2-4731-83cb-0bf916dddffe
Introducing UniFi OS Server for MSPs
 - https://blog.ui.com/article/introducing-unifi-os-server
END
