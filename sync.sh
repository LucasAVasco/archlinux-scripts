#!/bin/bash
#
# Copies this repository to the destination folder.
#
# $1: source folder
# $2: destination folder

src="$1"
dest="$2"

# Sends a copy of the repository to the destination
if [[ -d "$dest" ]]; then
	# The folder already exists, just synchronizes (better performance than copy)
	rsync -av --delete "$src/" "$dest/"
else
	# The folder does not exist, creates it
	cp -rT "$src" "$dest"
fi

# Updates the original repository in the configuration file
test -f "$deskt/conf.sh" && sed -i "s/^ARCHLINUX_SCRIPTS_ORIGINAL_REPO=.*//g" "$dest/conf.sh"
echo "ARCHLINUX_SCRIPTS_ORIGINAL_REPO=$src" >> "$dest/conf.sh"
