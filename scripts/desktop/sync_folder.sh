#!/bin/bash

source ../../libs/group.sh
source ../../libs/install.sh

sync_folder_hook() {
	group_ensure_exists sync_folder

	# Creates the folder
	local sync_folder_path=/home/sync_folder
	mkdir -p "$sync_folder_path"
	chown :sync_folder "$sync_folder_path"
	chmod 1770 "$sync_folder_path"
}

install_add_post_install sync_folder_hook
