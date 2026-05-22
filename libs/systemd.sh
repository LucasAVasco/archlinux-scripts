#!/bin/bash
#
# Systemd related functions

# Check if systemd is available (the system has been booted with systemd)
#
# Return 'y' if systemd is available, 'n' otherwise
systemd_is_available() {
	if ! command -v systemd-notify > /dev/null; then
		echo -n n
		return
	fi

	systemd-notify --booted && echo -n y || echo -n n
}
