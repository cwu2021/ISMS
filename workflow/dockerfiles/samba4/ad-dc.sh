#!/bin/bash
# https://hub.docker.com/r/imunew/samba4-ad-dc
# https://www.github.com/imunew/samba4-ad-dc
docker run -d -e SAMBA_DC_REALM='workgrouop.local' -e SAMBA_DC_DOMAIN='workgroup' -e SAMBA_DC_ADMIN_PASSWD='P@ssw0rd' -e SAMBA_DC_DNS_BACKEND='SAMBA_INTERNAL' --name samba4 'imunew/samba4-ad-dc'
docker exec -it samba4 uname -a
docker exec -it samba4 ping 1.1.1.1
docker exec -it samba4 netstat -tan | grep EST
docker exec -it samba4 netstat -tan | grep LISTEN
docker stop samba4
