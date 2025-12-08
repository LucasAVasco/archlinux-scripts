#!/bin/bash

source ../../libs/install.sh

# Enable 'seatd'. Required by all Wayland compositors
install_mark_packages seatd
seatd_hook() {
	systemctl enable --now seatd
}
install_add_post_install seatd_hook

# Wallpaper
install_mark_packages hyprpaper

# Qt applications
install_mark_packages qt5-wayland

# Automation (auto-click, auto-type, etc)
install_mark_packages wtype

# Clipboard
install_mark_packages wl-clipboard

# Menu/widgets
install_mark_packages rofi-wayland

# Screenshots
install_mark_packages grim slurp

# Screen saver
install_mark_packages hypridle

# Events (debug)
install_mark_packages wev

# Required to build Wayland applications
install_mark_packages wayland wayland-protocols
