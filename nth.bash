#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

pass "$1" | head -n1 | cut -c "$2"
