#!/bin/bash

source ../../libs/install.sh

# Network manager
install_mark_packages networkmanager

network_manager_hook() {
	systemctl start NetworkManager
	systemctl enable NetworkManager
}
install_add_post_install network_manager_hook

# Network tools
install_mark_packages inetutils termshark
