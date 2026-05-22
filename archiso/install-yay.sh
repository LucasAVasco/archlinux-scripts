#!/bin/bash
#
# Install 'yay'
#
# Must be executed by a 'admin' user. Do not run it as 'root'.
#
# Usage:
#   ./install-yay.sh [--pacman-args "pacman arguments"] [--sudo-args "sudo arguments"]
#
# Flags:
#   --pacman-args: Arguments to pass to the 'pacman' command
#   --sudo-args: Arguments to pass to the 'sudo' command

set -e

if [[ "$UID" -eq 0 ]]; then
	echo 'This script must be executed by a "admin" user. Do not run it as "root".'
	exit 1
fi

# Parse command line arguments
pacman_args=""
sudo_args=""
while [[ "$#" -gt 0 ]]; do
	case "$1" in
		--pacman-args)
			pacman_args="$2"
			shift 2
			;;

		--sudo-args)
			sudo_args="$2"
			shift 2
			;;

		*)
			echo "Unknown parameter passed: $1" >&2
			exit 1
			;;
	esac
done

# Temporary folder
tmpdir=$(mktemp --directory)
trap "rm -rf '$tmpdir'" EXIT
cd "$tmpdir"

# Installs base dependencies
sudo $sudo_args pacman -S --needed $pacman_args git base-devel go

# Builds the package
git clone https://aur.archlinux.org/yay.git "$tmpdir"
makepkg

# Installs the package
sudo $sudo_args pacman $pacman_args -U *.pkg.tar.zst
