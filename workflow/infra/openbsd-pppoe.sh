#!/bin/ksh
# LCP keepalive timeout every 350 sec after ISP upgrade. Not seen on proprietary or linux based routers.
tail /var/log/messages
# more tuning to pppoe may be required.
man pppoe
# LCP works fine after sdding inet6 settings in pppoe(4). LCP timeout happens for ipv4 only setting.
:'
wifi infra
 - modem can be set as pppoe gateway = DMZ
 - AP bridged into DMZ or NAT
 - vpn can run behind NAT
 - ubuntu server + pppoe 撥號 + NAT 供內部網路上網－Hello World｜痞客邦 https://helloworld.pixnet.net/blog/post/48030956
'
