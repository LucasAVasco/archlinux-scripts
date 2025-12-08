#!/bin/bash

source ../../libs/install.sh
source ../../libs/user.sh

serial_port_permission_hook() {
	source ../../conf.sh

	# Required to access the serial ports
	user_add_to_several_groups "${ARCHLINUX_SCRIPTS_MAIN_USER}_dev" uucp
}
install_add_post_install serial_port_permission_hook
