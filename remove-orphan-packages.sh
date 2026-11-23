#!/bin/bash
#
# Remove orphan packages.

set -euo pipefail

package_manager=pacman
if [[ "$UID" != 0 ]]; then # Admin can use 'yay'
	package_manager=yay
fi

if [[ -z "$("$package_manager" -Qdtq)" ]]; then
	echo 'No orphan packages found.'
	exit 0
fi

"$package_manager" -Qdtq | "$package_manager" -Rsu -
