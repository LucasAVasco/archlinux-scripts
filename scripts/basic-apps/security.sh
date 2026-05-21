#!/bin/bash

source ../../libs/install.sh

# password managers
install_mark_gui_packages keepassxc
install_mark_packages pass xkcdpass

# Wallet
install_mark_gui_packages seahorse

# Cryptography
install_mark_packages gnupg

# Backup
install_mark_gui_packages vorta

# SSH
install_mark_packages openssh
