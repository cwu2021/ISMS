#!/bin/bash
# dedicated network is required to ensure NDI performance and security.
ifconfig enp2s0 192.168.1.110 netmask 255.255.255.0
