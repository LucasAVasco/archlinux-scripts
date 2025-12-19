#!/bin/bash
#
# List the packages installed but not tracked by the installation scripts at './scripts/'.

set -e

source ./libs/install.sh
source ./libs/install_aur.sh

# Get the list of scripts to install

declare -a installation_scripts=(
	./scripts/*/*.sh
	./scripts/essential/firewall/install.sh
)

# Configure the libraries
install_create_files
install_aur_create_files
trap 'install_close' EXIT
trap 'install_aur_close' EXIT

# Assume some packages are already installed and are not managed by the installation scripts at './scripts/' {{{

# Mark the packages installed by 'pacstrap' during the first installation
install_mark_packages base btrfs-progs efibootmgr grub linux linux-firmware

# Mark the 'yay' package and its build dependencies
install_mark_packages go git base-devel go
install_aur_mark_packages yay

# }}}

# Update the list of packages to install
for script in "${installation_scripts[@]}"; do
	echo "Getting the list of packages from script: $script"
	./internal/get-pacman-packages.sh "$script"
done

# Get the list of installed and tracked packages
package_groups=$(cat "$INSTALL_PACKAGE_GROUPS_FILE" "$INSTALL_AUR_PACKAGE_GROUPS_FILE")
if [[ -n "$package_groups" ]]; then
	package_groups=$(echo -n "$package_groups" | tr ' ' '\n' | sort | uniq | yay -Qqg -)
fi
packages=$(printf '%s\n%s\n%s\n' "$package_groups" "$(cat "$INSTALL_PACKAGES_FILE")" "$(cat "$INSTALL_AUR_PACKAGES_FILE")" | \
	tr ' ' '\n' | sort | uniq)
tracked_packages=$(echo -n "$packages" | sort | uniq)
installed_packages=$(yay -Qqe | sort | uniq)

# Show the difference
echo -e "\033[0;32mThe following packages are installed but not tracked:\033[0m"
comm -23 <(echo -n "$installed_packages") <(echo -n "$packages")
