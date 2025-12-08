#!/bin/bash
#
# Command to install the base packages that I need during the first installation of Arch Linux.

pacstrap -K /mnt base linux linux-firmware btrfs-progs networkmanager vi neovim man-db man-pages zsh git make grub efibootmgr
