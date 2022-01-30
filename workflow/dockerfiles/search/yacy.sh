#!/bin/bash
# Alternative Engines
# https://www.linux-magazine.com/Issues/2021/249/Search-Engines/(offset)/9
docker run -d --name yacy -p 8090:8090 -p 8443:8443 -v yacy_data:/opt/yacy_search_server/DATA --log-opt max-size=200m--log-opt max-file=2 yacy/yacy_search_server:latest
