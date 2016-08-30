#!/bin/bash

/usr/sbin/php5-fpm --fpm-config /etc/php5/fpm/php-fpm.conf --daemonize
/usr/bin/mysqld_safe &
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"