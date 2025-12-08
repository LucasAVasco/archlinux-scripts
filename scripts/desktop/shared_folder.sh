#!/bin/bash

source ../../libs/group.sh
source ../../libs/install.sh

shared_folder_hook() {
	group_ensure_exists shared_folder

	# Creates the folder
	local shared_folder_path=/home/shared_folder/
	mkdir -p "$shared_folder_path"
	chown :shared_folder "$shared_folder_path"
	chmod 2770 "$shared_folder_path"
}

install_add_post_install shared_folder_hook
