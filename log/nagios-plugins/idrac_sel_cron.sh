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
