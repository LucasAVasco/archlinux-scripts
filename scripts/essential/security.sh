#!/bin/bash

source ../../libs/install.sh
source ../../libs/systemd.sh

# Antivirus
install_mark_packages clamav
install_mark_gui_packages clamtk
install_mark_deps cronie

# Enable and start clamav-freshclam
setup_clamav(){
	if [[ "$(systemd_is_available)" == y ]]; then
		systemctl enable --now clamav-freshclam.service
	fi
}
install_add_post_install setup_clamav

# Process isolation
install_mark_packages firejail

# Micro code
vendor_id=$(lscpu | grep 'Vendor ID:' | sed 's/.* //' | tr -d '\n')

if [[ "$vendor_id" == "AuthenticAMD" ]]; then
	install_mark_packages amd-ucode
elif [[ "$vendor_id" == "GenuineIntel" ]]; then
	install_mark_packages intel-ucode
else
	echo "Unknown CPU vendor: $vendor_id" >&2
	exit 1
fi
