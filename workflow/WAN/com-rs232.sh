#!/bin/bash
# https://community.cisco.com/t5/switching/cisco-catalyst-3560-not-boot/m-p/1701257#M176833
# Speed: 9600
# Data Bits: 8
# Stop Bits: 1
# Paraity: None
# Flow Control: None
# https://junyussh.github.io/p/linux-connect-serial-console/
sudo screen /dev/ttyUSB0 -s 9600
# https://stackoverflow.com/questions/8877269/writing-to-serial-port-from-linux-command-line
