#!/bin/bash
#
# Functions to create and manage users.

current_dir=$(dirname `realpath "${BASH_SOURCE[0]}"`)
source "$current_dir/group.sh"

# Create system users.
#
# $@: user names.
user_create_several_system_users() {
	local user
	for user in "$@"; do
		id -u "$user" > /dev/null 2>&1 || {
			useradd -r -s /usr/bin/nologin "$user"
		}
	done
}

# Create users that can be logged.
#
# $@: user names.
user_create_several_loggable_users() {
	local user
	for user in "$@"; do
		id -u "$user" > /dev/null 2>&1 || {
			useradd -m "$user"
		}
	done
}

# Add an user to several groups.
#
# $1: user name.
# $2..n: groups names.
user_add_to_several_groups() {
	local user="$1"

	local group
	for group in ${@:2}; do
		usermod -a -G "$group" "$user"
	done
}

# Configure users to be able to use the GUI.
#
# $@: users names.
user_enable_gui_to_several_users() {
	group_ensure_exists seat
	group_add_several_users seat "$@"
}

# Create users that can be logged and use the GUI.
#
# $@: users names.
user_create_several_users_with_gui() {
	user_create_several_loggable_users "$@"
	user_enable_gui_to_several_users "$@"
}

# Configures the user to be an administrator.
#
# $@: users names.
user_make_admins() {
	group_add_several_users sudo "$@"
}

# Create users that can be logged and are administrators.
#
# $@: users names.
user_create_admins() {
	group_ensure_exists sudo
	user_create_several_loggable_users "$@"
	user_make_admins "$@"
}

# Configures the user to be able to access the sync folder.
#
# $@: users names.
user_enable_sync_folder_to_users() {
	group_ensure_exists sync_folder
	group_add_several_users sync_folder "$@"
}

# Configures the user to be able to access the shared folder.
#
# $@: users names.
user_enable_shared_folder_to_users() {
	group_ensure_exists shared_folder
	group_add_several_users shared_folder "$@"
}
