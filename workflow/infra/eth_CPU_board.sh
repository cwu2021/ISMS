#!/bin/bash
# https://askubuntu.com/questions/1110943/what-do-the-different-thermal-zones-actually-correspond-to
# https://www.twblogs.net/a/5c7bf98abd9eee339918bbe9
cat /sys/class/thermal/thermal_zone*/temp
# How to Check Temperature on Linux
# https://phoenixnap.com/kb/linux-cpu-temp#:~:text=Check CPU Temperature Using Lm-Sensors,-Lm-sensors is&text=Wait for the lm-sensors,all sensors in the machine.
cat /sys/class/net/eth*/operstate
# https://linuxhint.com/check-link-speed-in-ubuntu/
sudo ethtool eth0
# https://unix.stackexchange.com/questions/121523/check-if-interface-eth0-is-up-configured
dmidecode -s system-product-name
# to get mainboard name.
