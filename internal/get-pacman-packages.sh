#!/bin/bash
#
# Run a script and saves the packages this script should install in the given files.
#
# $1: The script to run

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

# Sources the scripts in order to preserve the library configuration (the sourced script must have the same variables from the current
# script)
cd $(dirname "$1") # Relative to the sourced script
source "./$(basename "$1")"
