#!/bin/bash

source ../../../libs/install.sh

install_mark_packages nftables

# Hook to enable and configure nftables
nftables_hook() {
	systemctl enable nftables.service
	systemctl start nftables.service
	make enable
}

install_add_post_install nftables_hook
