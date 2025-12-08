#!/bin/bash
#
# Run a script and saves the packages this script should install in the given files.
#
# $1: File that saves the pacman packages to install.
# $2: File that saves the pacman dependencies to install.
# $3: File that saves the AUR packages to install.
# $4: File that saves the AUR dependencies to install.
# $5: The log file
# $6: The script to run

set -e

# Must source the libraries from the current directory
current_dir=$(dirname `realpath "${BASH_SOURCE[0]}"`)
cd "$current_dir"
unset current_dir

source ../libs/install.sh
source ../libs/install_aur.sh
source ../libs/log.sh

# Restore to the original directory
cd - > /dev/null

# Libraries configuration
__install_packages_file="$1"
__install_deps_file="$2"
__install_aur_packages_file="$3"
__install_aur_deps_file="$4"
__log_file="$5"

# Sources the scripts in order to preserve the library configuration (the sourced script must have the same variables from the current
# script)
cd $(dirname "$6") # Relative to the sourced script
source "./$(basename "$6")"
