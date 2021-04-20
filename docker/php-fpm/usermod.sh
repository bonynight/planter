#!/usr/bin/env bash

set -e

CUSER="www-data"
MYUID=`stat -c "%u" .`

mkdir -p /root/.ssh
find /var/www/.ssh/ -maxdepth 1 -type f -exec cp '{}' /root/.ssh \;
chmod 600 -R /root/.ssh

if [[ "$MYUID" -gt '0' && "$MYUID" != `id -u ${CUSER}` ]]; then
    usermod -u ${MYUID} ${CUSER}
fi

php-fpm