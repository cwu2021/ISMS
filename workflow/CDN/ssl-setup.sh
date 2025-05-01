#!/bin/bash
# How can I verify if TLS 1.2 is supported on a remote web server from the RHEL/CentOS shell?
# https://serverfault.com/questions/638691/how-can-i-verify-if-tls-1-2-is-supported-on-a-remote-web-server-from-the-rhel-ce
openssl s_client -connect google.com:443 -tls1_2
# CloudFront Custom SSL certificates
# https://blog.cloudthat.com/cloudfront-custom-ssl-certificate/
echo | openssl s_client -showcerts -servername gnupg.org -connect gnupg.org:443 2>/dev/null | openssl x509 -inform pem -noout -text
# Check ca.crt on local directly 
openssl x509 -inform pem -noout -text -in ca.crt
# https://serverfault.com/questions/661978/displaying-a-remote-ssl-certificate-details-using-cli-tools
# no need to include TrustedRoot.cer but DigiCertCA.cer to optimize bandwidth usage and page latency. Browsers have root CA but no intermediate ones.
cat mysite.cer > mysite.pem
cat DigiCertCA.cer >> mysite.pen
# https://unix.stackexchange.com/questions/32001/what-is-m-and-how-do-i-get-rid-of-it
dos2unix mysite.pem
# check validation via https://www.ssllabs.com/ssltest/index.html
#  www.shellhacks.com/openssl-check-ssl-certificate-expiration-date/
url=gnupg.org
echo | openssl s_client -servername ${url} -connect ${url}:443 | openssl x509 -noout -dates
# nginx - Is it necessary to regenerate the 'dhparam.pem' file 
# https://stackoverflow.com/questions/74561514/is-it-necessary-to-regenerate-the-dhparam-pem-file-every-time-i-renew-my-certi
# https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
: <<'SSLOFF'
Cloudflare by default runs "Flexible" for SSL:
SSL/TLS > Overview,  > SSL/TLS encryption mode 
It can be set to "Off" which is not recommended.  
https://developers.cloudflare.com/ssl/edge-certificates/additional-options/always-use-https/
SSLOFF
# Lets Encrypt: Ending Expiration Notification https://letsencrypt.org/2025/01/22/Ending-Expiration-Emails
# LibreSSL 4.1.0 Released: This is the
first stable release for the 4.1.x branch, also available with OpenBSD 7.7. The LibreSSL project continues improvement of the codebase to reflect modern,
safe programming practices. 