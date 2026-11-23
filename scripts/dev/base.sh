#!/bin/bash

source ../../libs/install.sh
source ../../libs/install_aur.sh

# Terminal
install_mark_gui_packages tmux wezterm kitty

# Text editor
install_mark_packages ex-vi-compat vim neovim
install_aur_mark_gui_packages visual-studio-code-bin

# Version control
install_mark_packages git git-lfs git-delta

# Build
install_mark_packages gcc clang
install_mark_packages base-devel meson autoconf-archive autoconf cmake # Build tools
install_mark_packages gdb # Debuggers
install_mark_packages entr # Run commands when files change

# HTTP
install_mark_packages curl wget socat

# Finder
install_mark_packages fzf fd ripgrep-all the_silver_searcher

# Shell
install_mark_packages zsh rlwrap

# Change directories
install_mark_packages z eza zoxide

# Pager
install_mark_packages bat
install_mark_packages lesspipe

# System monitor
install_mark_packages btop inxi
install_mark_packages strace

# Manual and cheat sheets
install_mark_packages man-db man-pages
install_mark_packages tealdeer

# File explorer
install_mark_packages vifm perl-image-exiftool
install_mark_gui_packages ueberzugpp ffmpegthumbnailer
install_mark_gui_deps ffmpeg pipewire-jack

# Data analysis
install_mark_packages miller

# Lua package manager
install_mark_packages luarocks

# Required to install App Images
install_mark_packages fuse2 fuse3
