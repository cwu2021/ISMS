#!/bin/bash
# CloudFront Custom SSL certificates
# https://blog.cloudthat.com/cloudfront-custom-ssl-certificate/
echo | openssl s_client -showcerts -servername gnupg.org -connect gnupg.org:443 2>/dev/null | openssl x509 -inform pem -noout -text
# https://serverfault.com/questions/661978/displaying-a-remote-ssl-certificate-details-using-cli-tools
# no need to include TrustedRoot.cer but DigiCertCA.cer to optimize bandwidth usage and page latency. Browsers have root CA but no intermediate ones.
cat mysite.cer > mysite.pem
cat DigiCertCA.cer >> mysite.pen
# https://unix.stackexchange.com/questions/32001/what-is-m-and-how-do-i-get-rid-of-it
dos2unix mysite.pem
# check validation via https://www.ssllabs.com/ssltest/index.html
