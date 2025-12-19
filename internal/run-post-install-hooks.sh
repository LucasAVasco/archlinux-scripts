#!/bin/bash
#
# Run a script and executes its post install hooks.
#
# $1: Run pacman hooks ('y' or 'n')
# $2: Run AUR hooks ('y' or 'n')
# $3: The script to run

set -e

# Must source the libraries from the current directory
current_dir=$(dirname `realpath "${BASH_SOURCE[0]}"`)
cd "$current_dir"
unset current_dir

source ../libs/install.sh
source ../libs/install_aur.sh
source ../libs/log.sh
source ./libs/install_execute.sh

# Restore to the original directory
cd - > /dev/null

# Sources the scripts in order to preserve the library configuration (the sourced script must have the same variables from the current
# script)
cd $(dirname "$3") # Relative to the sourced script
source "./$(basename "$3")"

if [ "$1" == y ]; then
	install_execute_hooks
fi

if [ "$2" == y ]; then
	install_execute_aur_hooks
fi
