sudo apt install snort
# snort config of Ubuntu focal includes fast alerts for admin prohibited reject.
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited

# modify existing iptables rules
iptables -L --line-number
iptables -R INPUT 11 -p icmp -j ACCEPT

# ping only scan for networks
nmap;nmap -sn 192.168.0.0/24
