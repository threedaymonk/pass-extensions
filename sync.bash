#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

pass git fetch
pass git rebase origin/master
pass git push
