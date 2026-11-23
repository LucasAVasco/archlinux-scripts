#!/bin/bash

source ../../libs/install.sh
source ../../libs/install_aur.sh

# Infrastructure management
install_mark_packages opentofu terragrunt

# Configuration management
install_mark_packages ansible
