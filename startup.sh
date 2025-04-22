#!/bin/bash

t=${TEXT:-ok}
echo $t >/var/www/html/index.html

p=${PORT:-38080}
echo "starting and listening on port $p"

exec /usr/sbin/mini_httpd -p $p -D -d /var/www/html -c "cgi-bin/*" -u www-data


