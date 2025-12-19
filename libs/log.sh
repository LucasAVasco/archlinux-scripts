#!/bin/bash
#
# Functions to log messages.

if [ "$__log_lib_already_loaded" == y ]; then
	return
fi
__log_lib_already_loaded=y

export LOG_FILE=${LOG_FILE:-/dev/null}

# Create the log file.
#
# Override the file if it already exists.
log_create_file() {
	export LOG_FILE="$(mktemp)"
}

# Register a log message.
#
# The message is read from stdin.
log_register() {
	local message=$(cat -)

	printf "%s\n" "$message" >> "$LOG_FILE"
}

# Show the log messages.
log_show() {
	cat "$LOG_FILE"
}

# Clear the log messages and delete the file.
#
# You can not use this library after calling this function.
log_close() {
	if [[ "$LOG_FILE" != '/dev/null' ]]; then
		rm "$LOG_FILE"
	fi
}
