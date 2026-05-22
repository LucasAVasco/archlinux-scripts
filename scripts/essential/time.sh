#!/bin/bash

source ../../libs/install.sh
source ../../libs/systemd.sh

ntp_hook() {
	# 'timedatectl' requires systemd to be enabled
	if [[ "$(systemd_is_available)" == y ]]; then
		# Documentation at https://wiki.archlinux.org/title/Systemd-timesyncd
		timedatectl set-ntp true
	fi
}

install_add_post_install ntp_hook
