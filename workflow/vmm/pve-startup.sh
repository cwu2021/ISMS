#!/bin/bash

#若你不需要 HA 的機制，那你可執行底下兩個指令來關閉 HA 的功能，來減少寫入:
pve-ha-lrm stop
pve-ha-crm stop

#ACL
iptables -A OUTPUT -d 1.2.3.4 -j DROP

# 要升級維護，要多次 reboot 時，可很簡單就將所有vm帶起的功能暫時關閉
#宣告變數ctids為陣列
declare -a ctids
ctids=(100 101 102)
for item in ${ctids[*]}
do
        #LXC偱序開機
        pct start $item
        sleep 10
done

##宣告變數vmids為陣列
declare -a vmids
vmids=(111 112)
for item2 in ${vmids[*]}
do
        #kvm偱序開
        qm start $item2
        sleep 20
done
