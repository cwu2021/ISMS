#!/bin/bash
# nginx log analysis with grc or zgrep for gz
# http://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_read_timeout
# https://ithelp.ithome.com.tw/m/questions/10186739
zgrep cgi error.log-20221231.gz  | grep "31 17" | grep time | grep client | more
# or via GoAccess or splunk
# https://docs.splunk.com/Documentation/AddOns/released/NGINX/Setupv2
apt install goaccess
# log-format %d %t %^, client: %h, server: %^, request: "%r", host: "%v"
# log-format %d %t %^, client: %h, server: %^, request: "%r", host: "%v", referrer: "%R"
# https://stackoverflow.com/questions/60074314/how-to-monitor-nginx-error-logs-with-goaccess
