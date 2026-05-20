#!/bin/bash

source ../../../libs/install.sh

# Basic (must be installed to run a Vulkan application)
install_mark_packages vulkan-icd-loader lib32-vulkan-icd-loader

# Vulkan mesa layers (required to select the device to use)
install_mark_packages vulkan-mesa-layers lib32-vulkan-mesa-layers

# Software rasterizer
install_mark_packages vulkan-swrast lib32-vulkan-swrast

# Debug the Vulkan application
install_mark_packages vulkan-tools
install_mark_package_groups vulkan-devel
