#!/bin/bash

function install_btop() {
	wget -qO btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz

	sudo tar xf btop.tbz -C /usr/local bin/btop

	btop --version

	rm -rf btop.tbz
}

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
else
	echo "Installing btop++"
	install_btop
fi
