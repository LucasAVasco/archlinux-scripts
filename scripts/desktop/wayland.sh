#!/bin/bash

source ../../libs/install.sh
source ../../libs/systemd.sh

# Enable 'seatd'. Required by all Wayland compositors
install_mark_gui_packages seatd
seatd_hook() {
	if [[ "$(systemd_is_available)" == y ]]; then
		systemctl enable --now seatd
	fi
}
install_add_gui_post_install seatd_hook

# Wallpaper
install_mark_gui_packages hyprpaper

# Qt applications
install_mark_gui_packages qt5-wayland

# Automation (auto-click, auto-type, etc)
install_mark_gui_packages wtype

# Clipboard
install_mark_gui_packages wl-clipboard

# Menu/widgets
install_mark_gui_packages rofi-wayland

# Screenshots
install_mark_gui_packages grim slurp

# Screen saver
install_mark_gui_packages hypridle

# Events (debug)
install_mark_gui_packages wev

# Required to build Wayland applications
install_mark_gui_packages wayland wayland-protocols

# Desktop portal
install_mark_gui_packages xdg-desktop-portal-wlr
