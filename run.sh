#!/bin/bash

# If exist, execute /extra/init . Must exit and not stay in front
if [ -e "/extra/init" ]; then
    if [ ! -x "/extra/init" ]; then
        chmod +x "/extra/init"
    fi
    /extra/init
fi

# Prepare DocumentRoot and start HTTPd
chown www-data:www-data /app -R
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
