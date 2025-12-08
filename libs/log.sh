#!/bin/bash
#
# Functions to log messages.

if [ "$__log_lib_already_loaded" == y ]; then
	return
fi
__log_lib_already_loaded=y

__log_file=/dev/null

# Register a log message.
#
# The message is read from stdin.
log_register() {
	local message=$(cat -)

	printf "%s\n" "$message" >> "$__log_file"
}

# Show the log messages.
log_show() {
	cat "$__log_file"
}
