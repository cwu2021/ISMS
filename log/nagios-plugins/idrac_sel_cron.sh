racadm getsel > idrac_sel.current
diff idrac_sel.current idrac_sel.old > /dev/null
if [ $? == 1 ]
then
        echo "2" > idrac_sel.log
else
        echo "0" > idrac_sel.log
fi
