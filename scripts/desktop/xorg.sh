#!/bin/bash

source ../../libs/install.sh

# Bars and widgets
install_mark_packages polybar

# Compositor
install_mark_packages picom

# Monitor and display management
install_mark_packages arandr

# Screen locker
install_mark_packages xss-lock xsecurelock

# Clipboard
install_mark_packages xclip

# Mouse / cursor
install_mark_packages unclutter

# Screenshots
install_mark_packages maim slop

# Xorg configuration (e.g.: touch-pad)
install_mark_packages xorg-xinput

# Automation (auto-click, auto-type, etc)
install_mark_packages xdotool xautomation
