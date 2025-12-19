#!/bin/bash

source ../../libs/install.sh
source ../../libs/install_aur.sh

# Screen brightness and temperature
install_mark_packages \
	gammastep \
	brightnessctl \
	ddcutil

brightnessctl_hook() {
	# Load UDEV rules that configure the permissions of backlight devices
	mkdir -p /etc/udev/rules.d
	cp ./backlight/backlight_devices_group.rules /etc/udev/rules.d/

	mkdir -p /etc/udev/my_scripts
	cp ./backlight/backlight_devices_group.sh /etc/udev/my_scripts/

	chmod +x /etc/udev/my_scripts/backlight_devices_group.sh
}

ddcutil_hook() {
	# Loads 'i2c-dev' kernel module (required by 'ddcutil')
	echo -n i2c-dev > /etc/modules-load.d/i2c-dev.conf
}

install_add_post_install brightnessctl_hook ddcutil_hook

# Desktop portal
install_mark_packages xdg-desktop-portal-kde

# Audio
install_mark_packages pipewire-pulse pipewire-jack
install_mark_packages pavucontrol # Audio management
install_mark_packages qpwgraph # More robust audio management

# Devices management
install_mark_packages udisks2
install_mark_packages baobab # Disk usage visualizer

# Notifications
install_mark_packages dunst

# Trash
install_mark_packages trash-cli

# Bars and widgets
install_aur_mark_packages quickshell-git
install_aur_mark_packages rofi
