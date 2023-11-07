#!/bin/bash
# manage config via git.
git clone https://github.com/cwu2021/ISMS.git
cd ISMS
git pull 

# package for ip addr
# https://askubuntu.com/questions/1212555/what-apt-package-installs-ip-addr-command
apt install iproute2 -y