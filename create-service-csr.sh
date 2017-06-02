#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  openssl req -config /root/ca/intermediate/openssl.cnf \
      -key /root/ca/intermediate/private/"${DOMAIN}".key.pem \
      -new -sha256 -out /root/ca/intermediate/csr/"${DOMAIN}".csr.pem
fi
