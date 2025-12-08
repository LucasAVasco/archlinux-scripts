#!/bin/bash

source ../../libs/install.sh

install_mark_packages qtile

# Xorg dependencies
install_mark_packages xorg-xinit xorg-server

# Wayland dependencies
install_mark_packages python-pywlroots
