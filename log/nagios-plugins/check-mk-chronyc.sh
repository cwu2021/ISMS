#!/bin/bash
# https://forum.checkmk.com/t/check-mk-english-ntp-time-check-returns-randomly-crit-state/12221
# no DNS lookup: chronyc -n tracking
mv /usr/bin/chronyc /usr/bin/chronyc.bak
cat > /usr/bin/chronyc << EOF
/usr/bin/chronyc.bak -n $1
EOF
# ntpq -p to check ntpd peer status
