#! /bin/bash

set -e
set -u

cd $(dirname "$0")

read password
#read -s password
echo -n $password | openssl rsautl -encrypt -pubin -inkey fdw_public.pem | base64 -w 0
echo
