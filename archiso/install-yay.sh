#!/bin/bash
#
# Install 'yay'
#
# Must be executed by a 'admin' user. Do not run it as 'root'.

set -e

if [[ "$UID" -eq 0 ]]; then
	echo 'This script must be executed by a "admin" user. Do not run it as "root".'
	exit 1
fi

# Temporary folder
tmpdir=$(mktemp --directory)
trap "rm -rf '$tmpdir'" EXIT
cd "$tmpdir"

# Installs base dependencies
sudo pacman -S --needed git base-devel go

# Builds the package
git clone https://aur.archlinux.org/yay.git "$tmpdir"
makepkg

# Installs the package
sudo pacman -U *.pkg.tar.zst
