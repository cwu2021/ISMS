#!/bin/bash
# https://github.com/lamw/ghettoVCB
# Support for VMware Consolidated Backup https://kb.vmware.com/s/article/1026945
# get names of vm
vmware-cmd -l | while read LINE
do
if [ -e "${LINE}" ]; then
grep displayName "${LINE}"
grep annotation "${LINE}"
echo " "
fi
done
./ghettoVCB.sh -f name_of_vm_to_backup -d debug
# VMware Migration to OpenStack https://www.openstack.org/vmware-migration-to-openstack/
: 'Resilience for a Changing World: A Year of Change, Progress, and Renewed Purpose 
 - OpenInfra基金會加入Linux基金會，加速開源基礎設施跨專案整合: OpenInfra基金會董事會通過決議，將以成員基金會身分正式加入Linux基金會，有助OpenStack與其他開源專案間的深度整合，推動全球開源基礎設施快速現代化
https://www.ithome.com.tw/news/167848