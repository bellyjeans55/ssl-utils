#!/bin/bash

SERVICE_DOMAIN="$1"
WEBSERVER_FQDN="$2"

if [ "$#" -eq 2  ]; then
  scp /root/"${SERVICE_DOMAIN}".tar "${WEBSERVER_FQDN}":/etc/ssl/certs/internal
  ssh "${WEBSERVER_FQDN}" "
        cd /etc/ssl/certs/internal
        tar -xf ${SERVICE_DOMAIN}.tar
        rm -f /etc/ssl/certs/internal/${SERVICE_DOMAIN}.tar
      "
  echo "Certs sent to webserver. Don't forget to add a config block!"
else
  echo "First argument should be service domain, second should be webserver FQDN."
fi
