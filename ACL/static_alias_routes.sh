#!/bin/bash
# static route policy could be massively deployed via puppet.
cat routeA.txt | while read LINE
do
route add $LINE gw $gateway1
done
cat routeB.txt | while read LINE
do
route add $LINE gw $gateway2
done
# However, real ACL should base on real physical segregation.
# Using IP alias and route to visit a site through assigned IP address
# https://serverfault.com/questions/66571/using-ip-alias-and-route-to-visit-a-site-through-assigned-ip-address
ifconfig eth0:1 [ip address]
ip route add [the target host ip]/32 via [gateway] dev eth0 src [ip address]
