#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  openssl genrsa -aes256 \
      -out /root/ca/intermediate/private/"${DOMAIN}".key.pem 2048
  chmod 400 /root/ca/intermediate/private/"${DOMAIN}".key.pem
fi
