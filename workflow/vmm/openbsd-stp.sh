#1/bin/ksh
# https://www.openbsd.org/faq/faq6.html#Bridge
cat /etc/hostname.bridge0 << EOF
add vether0
add vr1
add vr2
add vr3
# https://man.openbsd.org/hostname.if.5
# https://man.openbsd.org/ifconfig.8
stp vr1
EOF
