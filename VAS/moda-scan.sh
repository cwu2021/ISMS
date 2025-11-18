#!/bin/bash
# Ministry of Digital Affairs https://moda.gov.tw/
# https://pentest-tools.com/website-vulnerability-scanning/website-scanner
# PTT comments: https://www.ptt.cc/bbs/Gossiping/M.1659842984.A.B2C.html https://www.ptt.cc/bbs/Gossiping/M.1659834888.A.7AD.html
nslookup moda.gov.tw
whois 104.18.22.126
# OrgName:        Cloudflare, Inc.
# OrgId:          CLOUD14
# Address:        101 Townsend Street
# City:           San Francisco
# StateProv:      CA
# DNS records quick scan
# https://developers.cloudflare.com/dns/zone-setups/reference/dns-quick-scan

# Identify Operating System and Hops Using TTL Value
# Linux 64, Mac 64, FreeBSD 64, DragonFlyBSD 64, Cloudflare 64, Solaris 255, NetBSD 255, OpenBSD 255, Windows 128, Google 128. One hop minus 1.
# https://ostechnix.com/identify-operating-system-ttl-ping/
# Ethical Hacking TryHackMe's Capture https://www.linux-magazine.com/Issues/2025/291/Capture-the-Flag
# The Flipper Zero mobile hacking tool https://www.admin-magazine.com/Archive/2025/86/Mobile-hacking-tool?utm_source=AU
:'
Integrated Security with Wazuh
This versatile security app checks for vulnerabilities, watches logs, and acts as a single interface for other tools.
'
# One-liner to check WordPress, Joomla, Drupal, etc.
for path in wp-admin wp-login.php wp-content/themes admin/index.php sites/default/settings.php /laravel /react-build /static/js; do
  status=$(curl -s -o /dev/null -w "%{http_code}" https://my.site/$path)
  if [ "$status" = "200" ]; then echo "FOUND: $path (likely $(echo $path | cut -d/ -f1))"; fi
done

# Fetch homepage and search for generator/meta clues
curl -s https://my.site/ | grep -iE "(generator|wordpress|wp-content|drupal|joomla|laravel|react)"

# Headers + favicon hash (common for WP detection)
curl -sI https://my.site| grep -iE "(x-powered-by|server|framework)"
# For favicon: wget -q https://my.site/favicon.ico -O - | md5sum

# Install (one-time)
sudo apt update && sudo apt install whatweb

# Scan the site
whatweb https://my.site -v
:'
HTTP Headers:
        HTTP/1.1 200 OK
        Transfer-Encoding: chunked
        Content-Type: text/html; charset=utf-8
        Content-Encoding: gzip
        Vary: Accept-Encoding
        Server: Microsoft-IIS/10.0
        Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
        X-Powered-By: ASP.NET
        Date: Tue, 18 Nov 2025 08:48:56 GMT
        Connection: close
'