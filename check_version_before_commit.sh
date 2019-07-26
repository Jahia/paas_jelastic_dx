#!/bin/bash
#

# This script check for last version in RELEASENOTES.md
# and set this version for each version reference
# in yml package files


last_version=$(awk '$1=="###" {print $2; exit}' RELEASENOTES.md)
echo "last version detected in RELEASENOTES.md: ${last_version}"


find . -type f -name "*.yml" -print -exec \
    sed "s:[^\"]v[0-9]\.[0-9]\+[^\"]:${last_version}:" -i {} \;
