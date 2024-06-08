# https://easyengine.io/tutorials/php/fpm-slow-log/

cat >> /etc/php5/fpm/pool.d/www.conf << EOF
slowlog = /var/log/php8-slow.log
request_slowlog_timeout = 10s
php_admin_value[error_log] = /var/log/php8-error.log
php_admin_flag[log_errors] = on
EOF
systemctl restart php8.1-fpm
