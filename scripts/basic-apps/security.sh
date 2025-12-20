#!/bin/bash

source ../../libs/install.sh

# password managers
install_mark_packages keepassxc pass xkcdpass

# Wallet
install_mark_packages seahorse

# Cryptography
install_mark_packages gnupg

# Backup
install_mark_packages vorta

# SSH
install_mark_packages openssh
