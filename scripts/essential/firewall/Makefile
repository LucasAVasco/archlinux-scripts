install: FORCE
	systemctl enable nftables.service
	./nftables.conf && nft -s list ruleset | tee /etc/nftables.conf
	mkdir -p /etc/sysctl.d/
	cp ./sysctl.d/* /etc/sysctl.d/

uninstall: FORCE
	nft flush ruleset
	nft -s list ruleset

log: FORCE
	dmesg --color=always | less -r

list: FORCE
	nft -a list ruleset | less


FORCE:
.PHONY: FORCE
