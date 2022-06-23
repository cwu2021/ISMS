#!/bin/bash
# https://unix.stackexchange.com/questions/245208/modifying-existing-route-entry-in-linux
# https://unix.stackexchange.com/questions/449468/how-to-route-between-interfaces
cat /proc/sys/net/ipv4/ip_forward
ip route add 40.2.2.0/24 via 30.1.2.2 metric 1234
# Metric. – 第二個路由優先權數值，可大於255. – 數字越小的路由優先權越高
