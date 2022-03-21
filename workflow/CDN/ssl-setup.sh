#!/bin/bash
# CloudFront Custom SSL certificates
# https://blog.cloudthat.com/cloudfront-custom-ssl-certificate/
echo | openssl s_client -showcerts -servername gnupg.org -connect gnupg.org:443 2>/dev/null | openssl x509 -inform pem -noout -text
# https://serverfault.com/questions/661978/displaying-a-remote-ssl-certificate-details-using-cli-tools
