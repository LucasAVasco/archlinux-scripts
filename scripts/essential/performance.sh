#!/bin/bash

source ../../libs/install.sh
source ../../libs/systemd.sh

# Stress test
install_mark_packages stress

# Power manager
install_mark_packages power-profiles-daemon

power_profiles_daemon_hook() {
	if [[ "$(systemd_is_available)" == y ]]; then
		systemctl enable --now power-profiles-daemon
	fi

	powerprofilesctl set power-saver
}

install_add_post_install power_profiles_daemon_hook
