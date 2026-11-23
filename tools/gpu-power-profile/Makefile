.PHONY: FORCE

build-and-install: FORCE
	go build .
	sudo cp gpu-power-profile /usr/local/bin/gpu-power-profile
	sudo chown gpu:gpu /usr/local/bin/gpu-power-profile
	sudo chmod u+sxr,g+xr,o= /usr/local/bin/gpu-power-profile
