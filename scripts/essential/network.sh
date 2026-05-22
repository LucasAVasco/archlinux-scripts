#!/bin/bash

source ../../libs/install.sh
source ../../libs/systemd.sh

# Network manager
install_mark_packages networkmanager

network_manager_hook() {
	if [[ "$(systemd_is_available)" == y ]]; then
		systemctl start NetworkManager
		systemctl enable NetworkManager
	fi
}
install_add_post_install network_manager_hook

# Network tools
install_mark_packages inetutils termshark
