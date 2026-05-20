#!/bin/bash
#
# Install packages from the installation scripts. You can set the scripts to use with the "SCRIPTS_TO_INSTALL" variable at the "conf.sh"
# file

set -e

source ./libs/install.sh
source ./libs/install_aur.sh
source ./internal/libs/install_execute.sh
source ./libs/log.sh

# get the list of scripts to install
if [[ -f ./conf.sh ]]; then
	source ./conf.sh
fi

if [[ -z "${SCRIPTS_TO_INSTALL[@]}" ]]; then
	declare -a SCRIPTS_TO_INSTALL=(
		./scripts/essential/*.sh
		./scripts/essential/graphics/*.sh
		./scripts/essential/firewall/install.sh
		./scripts/desktop/*.sh
		./scripts/basic-apps/*.sh
		./scripts/dev/*.sh
		./scripts/dotfiles/*.sh
	)
fi

# Checks if the user is root
user_is_not_root=y
if [[ "$UID" -eq 0 ]]; then
	user_is_not_root=n
fi

# Configures the libraries
install_create_files
install_aur_create_files
log_create_file
trap 'install_close' EXIT
trap 'install_aur_close' EXIT
trap 'log_close' EXIT

# Updates the list of packages to install
for script in "${SCRIPTS_TO_INSTALL[@]}"; do
	echo "Getting the list of packages to install: $script"
	./internal/get-pacman-packages.sh "$script"
done

# Installs the packages
install_execute_installation

if [[ "$user_is_not_root" == y ]]; then # 'yay' does not work if the user is root
	install_execute_aur_installation
fi

# Runs the post-install hooks
for script in "${SCRIPTS_TO_INSTALL[@]}"; do
	sudo ./internal/run-post-install-hooks.sh y "$user_is_not_root" "$script"
done

# Shows the logs
log_show
