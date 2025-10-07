#!/bin/ksh
# https://bsdly.blogspot.com/2022/12/the-despicable-no-good-blackmail.html
tail -n 96 /var/log/traplistcounts
doas spamdb | grep -c TRAPPED
tail -n 500 -f /var/log/spamd
grep "You are in really big troubles therefore, you much better read" /var/log/spamd
zgrep "You are in really big troubles therefore, you much better read" /var/log/spamd.0.gz
grep "You are in really big troubles therefore, you much better read" /var/log/spamd | awk '{print $6}' | tr -d ':' | sort -u
grep 183.111.115.4 /var/log/spamd | tee wankstortion/20221123_trapped_183.111.115.4.txt
grep trouble /var/log/spamd | awk '{print $6}' | tr -d ':' | sort -u | grep -vc BLACK | tee -a wankstortion/20221123_campaign_ip_addresses.txt
for foo in $troubles ; do grep $foo /var/log/spamd | tee -a wankstortion/20221123_campaign_log_extract.txt ; done
# Proxmox Mail Gateway 9.0 released
