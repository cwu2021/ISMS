#!/bin/bash
# Searx as a Solution
# https://www.linux-magazine.com/Issues/2021/249/Search-Engines/(offset)/6
docker pull searx/searx
: '
Setting secret_key
01 server: port : 8888
02 bind_address : "127.0.0.1" # address to listen on
03 secret_key : "SuperSecretKey" # change this!
04 base_url : <http://localhost:/> # Set custom base_url.
05 Possible values: False or
06 "<https://your.custom.host/location/>"
07 image_proxy : False # Proxying image results
08 through searx http_protocol_version : "1.0" # 1.0 and
09 1.1 are supported
10 method: "POST" # POST queries are more secure as
11 they don't show up in history but may cause problems when using
12 Firefox containers
13 default_http_headers:
14 X-Content-Type-Options :nosniff
15 X-XSS-Protection : 1;
16 mode=block
17 X-Download-Options : noopen
18 X-Robots-Tag : noindex, nofollow
19 Referrer-Policy : no-referrer
'
