#!/bin/bash
#
# Functions to mark pacman packages to install.

if [ "$__install_lib_already_loaded" == y ]; then
	return
fi
__install_lib_already_loaded=y

export INSTALL_PACKAGES_FILE="${INSTALL_PACKAGES_FILE:-/dev/null}" # File with the packages to install (separated by spaces)
export INSTALL_DEPS_FILE="${INSTALL_DEPS_FILE:-/dev/null}" # File with the dependencies to install (separated by spaces)
declare -a INSTALL_POST_INSTALL_HOOKS=() # Hooks to run after installing all the packages

# Create the files to store the packages to install.
#
# Override the files if they already exist.
install_create_files() {
	export INSTALL_PACKAGES_FILE="$(mktemp)"
	export INSTALL_DEPS_FILE="$(mktemp)"
}

# Add packages to install.
#
# $@: List of packages to install.
install_mark_packages() {
	for package in "$@"; do
		echo -n "$package " >> "$INSTALL_PACKAGES_FILE"
	done
}

# Add packages to install as dependency.
#
# $@: List of packages to install.
install_mark_deps() {
	for package in "$@"; do
		echo -n "$package " >> "$INSTALL_DEPS_FILE"
	done
}

# Add post-install hooks. These hooks will be run after installing all the packages.
#
# $@: List of hooks to add.
install_add_post_install() {
	for hook in "$@"; do
		INSTALL_POST_INSTALL_HOOKS+=("$hook")
	done
}

# Clear the list of packages to install and delete the files.
#
# You can not use this library after calling this function.
install_close() {
	if [[ "$INSTALL_PACKAGES_FILE" != '/dev/null' ]]; then
		rm "$INSTALL_PACKAGES_FILE"
	fi

	if [[ "$INSTALL_DEPS_FILE" != '/dev/null' ]]; then
		rm "$INSTALL_DEPS_FILE"
	fi
}
