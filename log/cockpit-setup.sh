#!/bin/bash
apt install cockpit -y
# network manager issue for checking updates.
nmcli con add type dummy con-name fake ifname fake0 ip4 1.2.3.4/24 gw4 1.2.3.1
# secure with iptables
cat >> /etc/rc.local << EOF
#!/bin/bash
iptables -A INPUT -p tcp -s <admin_ip> --dport 9090 -j ACCEPT
iptables -A INPUT -p tcp --dport 9090 -j DROP
exit
EOF
systemctl start rc-local
# net availability 
systemctl disable cockpit.socket
# sysstat » ADMIN Magazine
# https://www.admin-magazine.com/Archive/2024/81/Admin-as-a-service-with-sysstat-for-ex-post-monitoring
# Monitoring system statuses: Mission Control https://www.linux-magazine.com/Issues/2025/293/System-Monitoring
# With Beowulf, everything was new. Previous HPC systems all had proprietary tools to manage and monitor servers (nodes) in the cluster, so the tools for Beowulf clusters had to be developed, including those to monitor clusters. During the first few years of this Clusterian period of HPC, one of the key requirements was a simple tool to monitor nodes – something simple that would give the status of all nodes in the cluster.
# https://www.admin-magazine.com/Articles/The-Resurrection-of-bWatch
