#!/bin/bash

# Cloudflare can offer valid cert from google for self-signed origin!
# https://www.cloudflare.com/ips/
# https://discussions.vtiger.com/discussion/173187/disabling-site-url

# https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/ngin
x-selfsigned.crt
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

cat > /etc/nginx/conf.d/myssl.conf << EOF
server {
listen 80;
    listen                      443 ssl http2 default_server;
    ssl_certificate             /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key         /etc/ssl/private/nginx-selfsigned.key;
    ssl_protocols               TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers   on;
root /var/www/html/vtigercrm;
index index.php index.html index.htm;
server_name myssl.example.com mytls.example.com;
client_max_body_size 100M;
location / {
try_files $uri $uri/ /index.php?$args;
}
EOF
systemctl restart php8.1-fpm
systemctl reload nginx
# 如何在 NGINX 伺服器中安裝 SSL 證書 https://www.gaia.net/tc/news_detail/2/127/nginx-ssl
cat yourdomain.crt SectigoRSADomainValidationSecureServerCA.crt USERTrustRSAAAACA.crt AAACertificateServices.crt >> bundle.crt
systemctl restart nginx
