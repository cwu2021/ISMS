#!/bin/ksh
# https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/LocationsOfEdgeServers.html
# https://ip-ranges.amazonaws.com/ip-ranges.json
# https://www.cloudflare.com/zh-tw/ips/
# https://www.cloudflare.com/ips-v4
cat >> /etc/pf.conf << EOF
table <cloudflare> persist file "/opt/ips-v4"
block in on $ext_if proto tcp from any to $ext_ip port 443
pass in on $ext_if proto tcp from <cloudflare> to $ext_ip port 443 rdr-to $internal_server port 443
EOF
# WAF for country rules can be applied on CDN security settings.
