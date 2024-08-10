#!/bin/sh

if test -f "~/.fluxbox/menu-apps"; then
	rm "~/.fluxbox/menu-apps"
fi

# mmaker -t Sakura -i -c FluxBox > menu-apps

xdgmenumaker --format fluxbox --icons > "~/.fluxbox/menu-apps"
