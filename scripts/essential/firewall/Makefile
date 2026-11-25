enable: FORCE
	# Configure sysctl
	sudo mkdir -p /etc/sysctl.d/
	sudo cp ./sysctl.d/* /etc/sysctl.d/

	# Configure nftables
	sudo cp ./nftables.conf /etc/nftables.conf

	# Enable nftables
	sudo systemctl enable nftables.service
	sudo systemctl start nftables.service

	# Update rules
	sudo ./nftables.conf

disable: FORCE
	sudo nft flush ruleset
	sudo nft -s list ruleset

log: FORCE
	sudo dmesg --color=always | less -r

list: FORCE
	sudo nft -a list ruleset | less

monitor: FORCE
	sudo ./lib/monitor.sh

FORCE:
.PHONY: FORCE
