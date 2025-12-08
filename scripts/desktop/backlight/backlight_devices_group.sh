#!/bin/bash
#
# Configure the provided backlight device. Enable all users into 'video' group to change the backlight of the provided device
#
# Arguments:
# $1: $DEVPATH environment variable. Needs to end with the device name. Example: 'path/to/device/device-name'

set -e

# Queries the device name from the device path
# NOTE: this approach considers that the provided device path does not ends with a slash '/'. Otherwise, the queried value will be empty
backlight_device_name="${1##*/}"

# Only applies the changes if the device has a 'brightness' files
brightness_file="/sys/class/backlight/$backlight_device_name/brightness"

if [[ -f "$brightness_file" ]]; then
	chgrp video "$brightness_file"
	chmod g+w "$brightness_file"
fi
