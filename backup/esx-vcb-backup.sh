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
