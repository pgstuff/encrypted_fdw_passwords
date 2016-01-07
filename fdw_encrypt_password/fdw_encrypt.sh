#! /bin/sh

read -r password
echo -n $password | openssl rsautl -encrypt -pubin -inkey fdw_public.pem | base64 -w 0
echo
