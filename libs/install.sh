#!/bin/bash
#
# Functions to mark pacman packages to install.

if [ "$__install_lib_already_loaded" == y ]; then
	return
fi
__install_lib_already_loaded=y

__install_packages_file=/dev/null # File with the packages to install (separated by spaces)
__install_deps_file=/dev/null # File with the dependencies to install (separated by spaces)
declare -a __install_post_install_hooks=() # Hooks to run after installing all the packages

# Add packages to install.
#
# $@: List of packages to install.
install_mark_packages() {
	for package in "$@"; do
		echo -n "$package " >> "$__install_packages_file"
	done
}

# Add packages to install as dependency.
#
# $@: List of packages to install.
install_mark_deps() {
	for package in "$@"; do
		echo -n "$package " >> "$__install_deps_file"
	done
}


# Add post-install hooks. These hooks will be run after installing all the packages.
#
# $@: List of hooks to add.
install_add_post_install() {
	for hook in "$@"; do
		__install_post_install_hooks+=("$hook")
	done
}
