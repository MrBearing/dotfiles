.PHONY: config deploy vimplug fzf ubuntu-setup

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
BIN_DIR = $(ROOT_DIR)/bin

TMUX_DIR = ./install/tmux
NVIM_DIR = ./install/nvim

all: config install deploy

deploy: tmux nvim
	mkdir -p $(BIN_DIR)
	cp $(TMUX_DIR)/temp/tmux $(BIN_DIR)/tmux
	cp $(NVIM_DIR)/temp/nvim $(BIN_DIR)/nvim

install: tmux nvim fzf vimplug

config:
	./config/install.sh

tmux:
	$(TMUX_DIR)/install.sh

nvim:
	$(NVIM_DIR)/install.sh

vimplug:
	./install/vimplug/install.sh

fzf:
	./install/fzf/install.sh

ubuntu-setup: ubuntu-ssh-server
	sudo apt install -y xsel

ubuntu-ssh-server:
	sudo apt install openssh-server x11vnc xvfb lightdm
	$(shell sed -i 's/#Port 22/Port 50000/g' /etc/ssh/sshd_config)
	sudo service ssh restart
	sudo x11vnc -storepasswd /etc/.vncpasswd
	sudo cp system/x11vnc.service /etc/systemd/system/x11vnc.service
	sudo systemctl enable x11vnc.service
	sudo systemctl start x11vnc.service

