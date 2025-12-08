#!/bin/bash
#
# Functions to create and manage groups.

# Create a group if it does not exist.
#
# $1: group name.
group_ensure_exists() {
	local group="$1"
	getent group "$group" > /dev/null 2>&1 || {
		groupadd "$group"
	}
}

# Add several users to a single group.
#
# $1: group name.
# $2..n: users names.
group_add_several_users() {
	local group="$1"

	local user
	for user in ${@:2}; do
		usermod -a -G "$group" "$user"
	done
}
