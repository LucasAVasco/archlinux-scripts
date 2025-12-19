#!/bin/bash

source ../../libs/install.sh

# Generic archiver. it does not provided the backend (example: zip, rar, etc). You need to install it manually
install_mark_packages atool

# Backends
install_mark_packages unzip zip unrar
