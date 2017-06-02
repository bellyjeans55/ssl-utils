#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  openssl ca -config /root/ca/intermediate/openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in /root/ca/intermediate/csr/"${DOMAIN}".csr.pem \
      -out /root/ca/intermediate/certs/"${DOMAIN}".cert.pem
  chmod 444 /root/ca/intermediate/certs/"${DOMAIN}".cert.pem
fi
