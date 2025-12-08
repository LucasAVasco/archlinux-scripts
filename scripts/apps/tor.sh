#!/bin/bash

source ../../libs/install.sh

install_mark_packages torbrowser-launcher

tor_hook() {
	systemctl disable tor
	systemctl stop tor
}

install_add_post_install tor_hook
