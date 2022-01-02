#!/bin/bash
: '
Can I CNAME a domain not on Cloudflare to a domain that is on Cloudflare?
https://support.cloudflare.com/hc/en-us/articles/360017421192-Cloudflare-DNS-FAQ#h_5o8rP75kFhX9g6jaDNSoTQ
No. If you would like to do a redirect for a site not on Cloudflare, then set up a traditional 301 or 302 redirect on your origin web server.
Redirecting non-Cloudflare sites via CNAME records would cause a DNS resolution error. Since Cloudflare is a reverse proxy for the domain that is on Cloudflare, the CNAME redirect for the domain (not on Cloudflare) wouldn't know where to send the traffic to.
'
nslookup cloudflare.com
