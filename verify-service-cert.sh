#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  openssl verify -CAfile /root/ca/intermediate/certs/ca-chain.cert.pem \
      /root/ca/intermediate/certs/"${DOMAIN}".cert.pem
fi
