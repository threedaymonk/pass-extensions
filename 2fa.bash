#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

TOTP_SEED=$(pass "$1" | grep "^2fa:" | cut -d" " -f2)
if [ -z "$TOTP_SEED" ]; then
  echo "Could not find a 2FA seed for $1." >&2
  exit 1
fi

TOTP=$(oathtool --totp --base32 "$TOTP_SEED" | tr -d '\n')
echo "$TOTP"
if [ ! -z ${DISPLAY:-} ]; then
  echo -n "$TOTP" | xclip -selection clipboard
  echo "Copied 2FA code for $1 to clipboard." >&2
fi
