#!/bin/bash

source ../../libs/install.sh

# Essential packages
install_mark_packages bluez bluez-utils

# Service
enable_service() {
	systemctl enable --now bluetooth

	# Enable the generic Bluetooth module
	modprobe btusb
	echo "btusb" > /etc/modules-load.d/btusb.conf
}

install_add_post_install enable_service

# Interfaces
install_mark_packages bluetui
install_mark_gui_packages blueman
