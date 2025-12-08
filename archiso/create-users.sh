#!/bin/bash
#
# Create users.

set -e

source ../libs/user.sh
source ../libs/group.sh

# Main user
source ../conf.sh
user="$ARCHLINUX_SCRIPTS_MAIN_USER"
if [[ -z "$user" ]]; then
	echo 'Please set the variable "ARCHLINUX_SCRIPTS_MAIN_USER" at the "conf.sh" file' >&2
	exit 1
fi

# General users
user_create_several_users_with_gui "${user}_dev" # Must be the first user, so it will have the id 1000 (useful in docker)
user_create_several_users_with_gui "$user" "${user}_games" "${user}_games_dev"
user_enable_sync_folder_to_users "${user}_dev" "$user"
user_enable_shared_folder_to_users "${user}_dev" "$user"

# Administrators
user_create_admins admin admin0
