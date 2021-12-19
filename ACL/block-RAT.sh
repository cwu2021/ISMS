# NginRAT appended on nginx process https://sansec.io/research/nginrat
# Operation Windigo https://blog.longwin.com.tw/2014/03/crack-windigo-hijacked-backdoor-trojan-hack-2014/
iptables -A POSTROUTING -s $src_ip -p tcp --sport $src_port -o $int_if -j RETURN

# explicit static routes would be perfect.
route delete default
