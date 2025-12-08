#!/bin/bash

source ../../libs/install.sh

# Kde connect
install_mark_packages kdeconnect
install_mark_deps qt6-multimedia-ffmpeg # 'kdeconnect' dependency

# Others
install_mark_packages rsync rclone syncthing
