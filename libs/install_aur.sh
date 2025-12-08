#!/bin/bash
#
# Functions to mark AUR packages to install.

if [ "$__install_aur_lib_already_loaded" == y ]; then
	return
fi
__install_aur_lib_already_loaded=y

__install_aur_packages_file=/dev/null # File with the packages to install (separated by spaces)
__install_aur_deps_file=/dev/null # File with the dependencies to install (separated by spaces)
declare -a __install_aur_post_install_hooks=() # Hooks to run after installing all the packages

# Add AUR packages to install.
#
# $@: List of AUR packages to install.
install_aur_mark_packages() {
	for package in "$@"; do
		echo -n "$package " >> "$__install_aur_packages_file"
	done
}

# Add AUR packages to install as dependency.
#
# $@: List of AUR packages to install.
install_aur_mark_deps() {
	for package in "$@"; do
		echo -n "$package " >> "$__install_aur_deps_file"
	done
}

# Add post-install hooks. These hooks will be run after installing all the packages.
#
# $@: List of hooks to add.
install_aur_add_post_install() {
	for hook in "$@"; do
		__install_aur_post_install_hooks+=("$hook")
	done
}
