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
# trapping spammer with blacklist to avoid ip changing.
# man spamd.conf: blacklisted hosts are diverted to spamd and tarpitted 
# i.e. they are communicated with very slowly to consume the sender's resources.
EOF
