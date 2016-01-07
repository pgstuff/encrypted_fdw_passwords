#! /bin/sh

if [ -e fdw_private.pem ]; then
	echo "A private key already exists." >&2
	exit 1
fi

openssl genrsa -out fdw_private.pem 2048
openssl rsa -in fdw_private.pem -outform PEM -pubout -out fdw_public.pem
cp fdw_public.pem ../fdw_encrypt_password/fdw_public.pem
echo "Copied public key to fdw_encrypt_password.  Keep fdw_private.pem safe."
echo
echo "Put this in into the privateKeyB64B64ShiftedB64Shifted variable (located in fdw_patches/*_fdw-*-rsa_password.patch"
./fdw_private_key_encode_c.sh
