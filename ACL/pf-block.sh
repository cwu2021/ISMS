#!/bin/ksh
# https://bsdly.blogspot.com/2022/09/a-few-of-my-favorite-things-about.html
cat > /etc/pf.conf << EOF
block all
match out on egress nat-to egress
pass in on egress proto tcp to egress port ssh
EOF
