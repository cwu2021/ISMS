#!/bin/bash
# nslookup.io as the web app.
# Find DNS records for a domain name using this online tool.
nslookup -type=txt your.domain 168.95.1.1
# Gmail requires valid SPF for accepting delivery, e.g. v=spf1 ip4:your.smtp/24 a mx ~all
# https://code.yidas.com/nslookup/
