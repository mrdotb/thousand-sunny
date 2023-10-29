#!/bin/bash
#
# Setup age.agekey if it does not exist already.

AGE_KEYS="$HOME/.config/sops/age/keys.txt"

if [ -e "$AGE_KEYS" ]; then
    echo "File $AGE_KEYS already exists."
    exit 1
fi

age-keygen -o age.agekey
mkdir -p $HOME/.config/sops/age
mv age.agekey $HOME/.config/sops/age/keys.txt
echo -e "Source from .profile: \n\nexport SOPS_AGE_KEY_FILE=$AGE_KEYS"
