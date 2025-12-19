#!/bin/bash
#
# Functions to mark AUR packages to install.

if [ "$__install_aur_lib_already_loaded" == y ]; then
	return
fi
__install_aur_lib_already_loaded=y

export INSTALL_AUR_PACKAGES_FILE="${INSTALL_AUR_PACKAGES_FILE:-/dev/null}" # File with the packages to install (separated by spaces)
export INSTALL_AUR_PACKAGE_GROUPS_FILE="${INSTALL_AUR_PACKAGE_GROUPS_FILE:-/dev/null}" # File with the packages groups to install (separated by spaces)
export INSTALL_AUR_DEPS_FILE="${INSTALL_AUR_DEPS_FILE:-/dev/null}" # File with the dependencies to install (separated by spaces)
declare -a INSTALL_AUR_POST_INSTALL_HOOKS=() # Hooks to run after installing all the packages

# Create the files to store the packages to install.
#
# Override the files if they already exist.
install_aur_create_files() {
	export INSTALL_AUR_PACKAGES_FILE="$(mktemp)"
	export INSTALL_AUR_PACKAGE_GROUPS_FILE="$(mktemp)"
	export INSTALL_AUR_DEPS_FILE="$(mktemp)"
}

# Add AUR packages to install.
#
# $@: List of AUR packages to install.
install_aur_mark_packages() {
	for package in "$@"; do
		echo -n "$package " >> "$INSTALL_AUR_PACKAGES_FILE"
	done
}

# Add AUR package groups to install.
#
# $@: List of AUR package groups to install.
install_aur_mark_package_groups() {
	for group in "$@"; do
		echo -n "$group " >> "$INSTALL_AUR_PACKAGE_GROUPS_FILE"
	done
}

# Add AUR packages to install as dependency.
#
# $@: List of AUR packages to install.
install_aur_mark_deps() {
	for package in "$@"; do
		echo -n "$package " >> "$INSTALL_AUR_DEPS_FILE"
	done
}

# Add post-install hooks. These hooks will be run after installing all the packages.
#
# $@: List of hooks to add.
install_aur_add_post_install() {
	for hook in "$@"; do
		INSTALL_AUR_POST_INSTALL_HOOKS+=("$hook")
	done
}

# Clear the list of packages to install and delete the files.
#
# You can not use this library after calling this function.
install_aur_close() {
	if [[ "$INSTALL_AUR_PACKAGES_FILE" != '/dev/null' ]]; then
		rm "$INSTALL_AUR_PACKAGES_FILE"
	fi

	if [[ "$INSTALL_AUR_PACKAGE_GROUPS_FILE" != '/dev/null' ]]; then
		rm "$INSTALL_AUR_PACKAGE_GROUPS_FILE"
	fi

	if [[ "$INSTALL_AUR_DEPS_FILE" != '/dev/null' ]]; then
		rm "$INSTALL_AUR_DEPS_FILE"
	fi
}
