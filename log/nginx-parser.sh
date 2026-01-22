#!/bin/bash
# nginx log analysis with grc or zgrep for gz
# http://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_read_timeout
# https://serverfault.com/questions/178671/nginx-php-fpm-504-gateway-time-out-error-with-almost-zero-load-on-a-test-se
# https://ithelp.ithome.com.tw/m/questions/10186739
zgrep cgi error.log-20221231.gz  | grep "31 17" | grep time | grep client | more
# or via GoAccess or splunk
# https://docs.splunk.com/Documentation/AddOns/released/NGINX/Setupv2
apt install goaccess
# log-format %d %t %^, client: %h, server: %^, request: "%r", host: "%v"
# log-format %d %t %^, client: %h, server: %^, request: "%r", host: "%v", referrer: "%R"
# https://stackoverflow.com/questions/60074314/how-to-monitor-nginx-error-logs-with-goaccess
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-goaccess-web-log-analyzer-on-ubuntu-20-04
: '
Observability Day 可觀察性技術日【徵求講者】歡迎投稿分享如何用可觀察性解決真實世界的複雜問題
'