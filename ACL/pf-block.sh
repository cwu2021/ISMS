#!/bin/ksh
# https://bsdly.blogspot.com/2022/09/a-few-of-my-favorite-things-about.html
cat > /etc/pf.conf << EOF
block all
match out on egress nat-to egress
pass in on egress proto tcp to egress port ssh
# bad ip
table <banned> persist file "/etc/mail/banned.list"
block in from <banned>
# for example, 194.180.50.0/24
EOF
