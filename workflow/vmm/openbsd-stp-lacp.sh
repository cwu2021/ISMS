#1/bin/ksh
# Some OpenBSD features that aren't widely known
# https://dataswamp.org/~solene/2024-02-20-rarely-known-openbsd-features.html
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
# https://man.openbsd.org/aggr.4
ifconfig aggr0 create
ifconfig aggr0 trunkport em0
ifconfig aggr0 trunkport em1
ifconfig aggr0 10.1.1.100/24
ifconfig aggr0 up
