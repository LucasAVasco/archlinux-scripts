#!/bin/bash

source ../../../libs/install.sh
source ../../../libs/user.sh

gpu_power_setup() {
	user_create_several_system_users "gpu"

	cp ./*.rules /etc/udev/rules.d/
	cp ./*.service /etc/systemd/system/
}

install_add_post_install gpu_power_setup
