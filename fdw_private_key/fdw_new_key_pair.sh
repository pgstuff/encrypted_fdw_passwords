#! /bin/bash

set -e
set -u

cd $(dirname "$0")

if [ -e fdw_private.pem ]; then
	echo "A private key already exists." >&2
	exit 2
fi

echo "Generating new private / public key pair."
openssl genrsa -out fdw_private.pem 2048
openssl rsa -in fdw_private.pem -outform PEM -pubout -out fdw_public.pem
echo "Finished generating.  Keep fdw_private.pem safe."

echo "Copying public key to fdw_encrypt_password."
cp fdw_public.pem ../fdw_encrypt_password/fdw_public.pem

./fdw_patch_in_key.sh

echo "Ready to compile, install FDWs, and encrypt passwords."
