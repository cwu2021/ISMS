#!/bin/bash
# server 0.debian.pool.ntp.org iburst
# server 1.debian.pool.ntp.org iburst
# server 2.debian.pool.ntp.org iburst
# server 3.debian.pool.ntp.org iburst
nslookup
cat > routeA.txt << EOF
111.235.248.121
122.117.24.100
123.241.7.203
114.35.131.27
122.117.253.246
17.253.116.253
162.159.200.1
162.159.200.123
220.132.100.157
103.147.23.5
112.104.189.124
1.34.13.89
118.163.170.6
49.213.184.242
118.163.74.161
103.169.212.1
EOF
