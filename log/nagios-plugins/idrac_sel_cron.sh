# Dell EMC OpenManage Repository
# https://linux.dell.com/repo/community/openmanage/
# https://linux.dell.com/repo/community/ubuntu/
# Integrated Dell Remote Access Controller 9 RACADM CLI Guide
# https://www.dell.com/support/manuals/zh-tw/idrac9-lifecycle-controller-v5.x-series/idrac9_5.xx_racadm_pub/hwinventory?guid=guid-c6325122-f01b-4125-a9f4-075040165e8f&lang=en-us
# apt-get update very slow, stuck at "Waiting for headers" - Ask Ubuntu
# https://askubuntu.com/questions/156650/apt-get-update-very-slow-stuck-at-waiting-for-headers

racadm getsel > idrac_sel.current
diff idrac_sel.current idrac_sel.old > /dev/null
if [ $? == 1 ]
then
        echo "2" > idrac_sel.log
else
        echo "0" > idrac_sel.log
fi

# if "One Instance of Local RACADM is already executing.Exiting the current session" happens:
# https://www.dell.com/support/kbdoc/zh-tw/000196996/ecs-racadm-%E5%82%B3%E5%9B%9E-one-instance-of-local-racadm-is-already-executing-exiting-the-current-session
# ls -l /var/run/local_racadm.pid
# sudo rm -rf /var/run/local_racadm.pid
