#!/bin/bash

source ../../libs/install.sh

# Antivirus
install_mark_packages clamav clamtk
install_mark_deps cronie

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
