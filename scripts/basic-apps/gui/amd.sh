#!/bin/bash

source ../../../libs/install.sh

# AMD specific
# NOTE(LucasAVasco): amdgpu_top has a TUI version, so we can install it even in environment without GUI
install_mark_packages amdgpu_top
