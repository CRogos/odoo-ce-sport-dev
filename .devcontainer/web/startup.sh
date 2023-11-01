#!/bin/bash

set -e

echo "Startup starting"

if ! test -f /etc/odoo/odoo.conf; then
  echo "Create new config"
  cp /etc/odoo/empty.odoo.conf /etc/odoo/odoo.conf
fi

/usr/bin/python3 /tmp/debugpy --listen 0.0.0.0:8888 /src/odoo/odoo-bin --db_user=$db_user --db_host=$db_host --db_password=$db_password -c /etc/odoo/odoo.conf

exit 1