#!/bin/bash

source ../../libs/install.sh

# SSH
install_mark_packages sshfs # openssh is already installed in the basic security package (../basic-apps/security.sh)

# VM tools
if [[ "$(install_is_gui_enabled)" == y ]]; then
	install_mark_packages qemu-full
else
	install_mark_packages qemu-base
fi

install_mark_packages libvirt virt-install dnsmasq

# Cloud image packages
install_mark_packages cloud-utils
