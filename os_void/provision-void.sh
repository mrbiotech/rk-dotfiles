#!/bin/sh

# Update all packages
sudo xbps-install -Su

# CLI Software I like
sudo xbps-install zsh vim vim-common vim-colorschemes sakura kitty lynx emacs emacs-common nmap eza tmux polybar 

# Graphical software I like
sudo xbps-install feh gimp inkscape yabar tint2 pekwm jgmenu ImageMagick graphviz xdot python3-graphviz openbox obconf libopenbox obmenu-generator pcmanfm lightdm lxdm lightdm-gtk3-greeter xfdesktop

sudo xbps-remove -yO
sudo xbps-remove -yo
sudo vkpurge rm all
