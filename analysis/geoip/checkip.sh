#!/bin/bash
# checkip services other than checkip.amazonaws.com .
# https://stackoverflow.com/questions/52618096/under-what-circumstances-does-checkip-amazonaws-com-return-multiple-addresses
# https://opensource.com/article/18/5/how-find-ip-address-linux
curl ifconfig.me
curl -4/-6 icanhazip.com
curl ipinfo.io/ip
curl api.ipify.org
curl checkip.dyndns.org
dig +short myip.opendns.com @resolver1.opendns.com
host myip.opendns.com resolver1.opendns.com
curl ident.me
curl --max-time 2 checkip.amazonaws.com
