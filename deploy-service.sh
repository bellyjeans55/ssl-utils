#!/bin/bash

DOMAIN="$1"

if [[ -z "${DOMAIN}" ]]; then
  echo "First argument should be domain."
else
  mkdir -p /root/tmp/"${DOMAIN}"
  cat /root/ca/intermediate/certs/ca-chain.cert.pem \
      /root/ca/intermediate/certs/"${DOMAIN}".cert.pem \
      > /root/tmp/"${DOMAIN}"/ca-chain.cert.pem
  cp /root/ca/intermediate/private/"${DOMAIN}".key.pem \
      /root/tmp/"${DOMAIN}"/key.pem
  tar -cf /root/"${DOMAIN}".tar \
      -C /root/tmp \
      "${DOMAIN}"/ca-chain.cert.pem \
      "${DOMAIN}"/key.pem 
  rm -rf /root/tmp
  echo Certs bundled at /root/"${DOMAIN}".tar
fi
