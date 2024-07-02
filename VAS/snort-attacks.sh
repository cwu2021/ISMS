sudo apt install snort
# snort config of Ubuntu focal includes fast alerts for admin prohibited reject.
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited
