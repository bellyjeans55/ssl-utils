#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  tar -cf /root/"${DOMAIN}".tar \
      -C /root/ca/intermediate/certs \
      ca-chain.cert.pem \
      "${DOMAIN}".cert.pem \
      -C /root/ca/intermediate/private \
      "${DOMAIN}".key.pem 
  echo Certs bundled at /root/"${DOMAIN}".tar
fi
