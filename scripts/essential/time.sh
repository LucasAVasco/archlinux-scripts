#!/bin/bash

source ../../libs/install.sh

ntp_hook() {
	# Documentation at https://wiki.archlinux.org/title/Systemd-timesyncd
	timedatectl set-ntp true
}

install_add_post_install ntp_hook
