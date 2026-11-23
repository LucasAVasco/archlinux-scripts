#!/bin/bash

source ../../libs/install.sh

# File manager
install_mark_gui_packages thunar

# Create and format partitions (e.g.: fat32)
install_mark_packages dosfstools
