#! /bin/bash

set -e
set -u

cd $(dirname "$0")

encoded_private_key=$(./fdw_private_key_encode_c.sh | sed 's/\\/\\\\/g')

echo "Patching FDW patches with the private key."
cd template_patches
for patch_file in $( ls *.patch ); do
    cat "$patch_file" | sed "s/ENCODED_PRIVATE_KEY_PLACEHOLDER/$encoded_private_key/" > "../../fdw_patches/$patch_file"
done
cd ..
