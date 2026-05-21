enable: FORCE
	# Configure sysctl
	mkdir -p /etc/sysctl.d/
	cp ./sysctl.d/* /etc/sysctl.d/

	# Configure nftables
	cp ./nftables.conf /etc/nftables.conf

	# Enable nftables
	systemctl enable nftables.service
	systemctl start nftables.service

	# Update rules
	./nftables.conf

disable: FORCE
	nft flush ruleset
	nft -s list ruleset

log: FORCE
	dmesg --color=always | less -r

list: FORCE
	nft -a list ruleset | less

monitor: FORCE
	./lib/monitor.sh

FORCE:
.PHONY: FORCE
