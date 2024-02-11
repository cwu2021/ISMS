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
# https://unix.stackexchange.com/questions/94604/does-curl-have-a-timeout
curl --max-time 2 checkip.amazonaws.com
# 在 Windows 上設定 hosts 檔案：使用像是「記事本」等文字編輯器開啟 hosts 檔案。hosts 檔案位於 \Windows\System32\drivers\etc\hosts
# https://help.sap.com/docs/SAP_BUSINESSOBJECTS_BUSINESS_INTELLIGENCE_PLATFORM/2e167338c1b24da9b2a94e68efd79c42/4690457a6e041014910aba7db0e91070.html?locale=zh-TW
