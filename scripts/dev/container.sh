#!/bin/bash

source ../../libs/install.sh
source ../../libs/install_aur.sh

# Docker
install_mark_packages docker docker-buildx

# Rootless docker
rootless_docker_hook() {
	systemctl stop docker.service
	systemctl disable docker.service

	# Enables CPU and CPUSET delegation (from the official docs at
	# https://rootlesscontaine.rs/getting-started/common/cgroup2/#enabling-cpu-cpuset-and-io-delegation)
	mkdir -p /etc/systemd/system/user@.service.d
	cat > /etc/systemd/system/user@.service.d/delegate.conf <<-EOF
		[Service]
		Delegate=cpu cpuset io memory pids
EOF
	systemctl daemon-reload
}

source ../../conf.sh
if [[ "$ARCHLINUX_SCRIPTS_ROOTLESS_DOCKER" != n ]]; then # The default (user do not configure it) is to install in rootless mode
	install_mark_packages rootlesskit slirp4netns fuse-overlayfs # Rootless docker dependencies
	install_aur_mark_packages docker-rootless-extras
	install_add_post_install rootless_docker_hook
fi

# Docker compose
install_mark_packages docker-compose

# Podman
install_mark_packages podman podman-compose
install_mark_packages qemu-user-static qemu-user-static-binfmt # Required by Podman to use vitalization

# Kubernets
install_mark_packages kubectl kubeadm helm kustomize
install_mark_packages k9s

# Distribution in containers
install_mark_packages distrobox fuse-overlayfs
