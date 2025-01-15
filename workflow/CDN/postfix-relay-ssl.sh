#!/bin/bash
# Zimbra proxy is a paid solution which utilizes nginx proxy,
#  which implies that pops port 995, imaps port 993, smtps port 587 can be set. 
# postfix relay with iptables input block. opensmtpd !for gmail relay host smtps:// . changing external gw ip useless to unblock gmail.
# google workspace same mx as gmail...
# https://wiki.centos.org/HowTos/postfix_sasl#Configuring_SSL.2FTLS_in_postfix
# nginx as mail proxy https://docs.nginx.com/nginx/admin-guide/mail-proxy/mail-proxy/
cat >> /etc/nginx/nginx.conf << EOF
mail {
    server_name mail.example.com;
    auth_http   localhost:9000/cgi-bin/nginxauth.cgi;

    proxy_pass_error_message on;

    #ssl                 on;
    #ssl_certificate     /etc/ssl/certs/server.crt;
    #ssl_certificate_key /etc/ssl/certs/server.key;
    #ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    #ssl_ciphers         HIGH:!aNULL:!MD5;
    #ssl_session_cache   shared:SSL:10m;
    #ssl_session_timeout 10m;

    server {
        listen     25;
        protocol   smtp;
                smtp_auth  login plain cram-md5;
    }

    server {
        listen    110;
        protocol  pop3;
        pop3_auth plain apop cram-md5;
}

     server {
        listen   143;
        protocol imap;
    }
}
EOF
# Thunderbird setup for older TLS support:
# https://support.mozilla.org/en-US/questions/1295861
# https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
: <<'END'
Try to change in THUNDERBIRD preferences editor security.tls.version.min from 3 to 1
From the menu at the top right, go to Options.
Scroll all the way to the bottom and click on Config Editor.
Skip past the warning.
Scroll down until you find security.tls.version.min (or paste security.tls.version.min to upper frame)
Double click on it, and set the value to 1
(and also disable autoupdate)
END
