install: FORCE
	./install.sh

list-non-tracked: FORCE
	./list-non-traked-packages.sh

send-to-admin: FORCE
	cp -rT . /home/admin/archlinux-scripts
	sudo ./sync.sh "$$PWD" /home/admin/archlinux-scripts
	sudo chown -R admin:admin /home/admin/archlinux-scripts

receive-from-origin: FORCE
	source ./conf.sh && sudo ./sync.sh "$$ARCHLINUX_SCRIPTS_ORIGINAL_REPO" "$$PWD"
	sudo chown -R "$$USER":"$$USER" "$$PWD"

clear: FORCE
	./remove-orphan-packages.sh

FORCE:
.PHONY: FORCE
