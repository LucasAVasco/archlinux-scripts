#!/bin/bash
#
# Functions to install packages marked with the '../../libs/install.sh' and '../../libs/install_aur.sh' libraries.

current_dir=$(dirname `realpath "${BASH_SOURCE[0]}"`)
source "$current_dir/../../libs/install.sh"
source "$current_dir/../../libs/install_aur.sh"
source "$current_dir/../../libs/log.sh"

# Install pacman packages.
install_execute_installation() {
	local deps=$(cat "$INSTALL_DEPS_FILE")
	local packages=$(cat "$INSTALL_PACKAGES_FILE" "$INSTALL_PACKAGE_GROUPS_FILE")

	if [[ -n "$deps" ]]; then
		sudo pacman -S --needed --asdeps $deps
	fi

	if [[ -n "$packages" ]]; then
		sudo pacman -S --needed $packages
	fi
}

# Run post-install hooks.
install_execute_hooks() {
	local hook
	for hook in "${INSTALL_POST_INSTALL_HOOKS[@]}"; do
		echo "Running post-install hook: $hook"
		"$hook"
	done
}

# Install AUR packages.
install_execute_aur_installation() {
	local deps=$(cat "$INSTALL_AUR_DEPS_FILE")
	local packages=$(cat "$INSTALL_AUR_PACKAGES_FILE" "$INSTALL_AUR_PACKAGE_GROUPS_FILE")

	if [[ -n "$deps" ]]; then
		yay -S --needed --asdeps $deps
	fi

	if [[ -n "$packages" ]]; then
		yay -S --needed $packages
	fi
}

# Run AUR post-install hooks.
install_execute_aur_hooks() {
	local hook
	for hook in "${INSTALL_AUR_POST_INSTALL_HOOKS[@]}"; do
		echo "Running post-install hook: $hook"
		"$hook"
	done
}
