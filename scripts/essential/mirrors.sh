#!/bin/bash

source ../../libs/install.sh

install_mark_packages reflector

reflector_hook() {
	systemctl enable reflector.timer
}

install_add_post_install reflector_hook
