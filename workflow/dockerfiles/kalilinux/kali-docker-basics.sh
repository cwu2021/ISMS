#!/bin/bash
apt update
apt -y install kali-linux-headless
apt install ping
apt install iputils-ping
nmap -p 80 -A $target_ip
cd /usr/share/nmap/
cd scripts/
ls *http*
wpscan
nslookup $target_url
wpscan --url $target_url --enumerate p
wpscan --url $target_url --enumerate p --random-user-agent
wpscan --url $target_ip --enumerate p --random-user-agent -exit-api-token $your_token
nmap -v -A $target_ip
