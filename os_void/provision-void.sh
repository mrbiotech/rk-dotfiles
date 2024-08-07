#!/bin/sh

# Update all packages
sudo xbps-install -Su

# CLI Software I like
sudo xbps-install git zsh vim vim-common vim-colorschemes sakura kitty lynx emacs emacs-common rclone nmap eza rofi dunst picom tmux xdgmenumaker polybar pastel peco jq

# Graphical software I like
sudo xbps-install feh rclone-browser fluxbox aseprite gimp inkscape yabar tint2 pekwm jgmenu ImageMagick graphviz xdot python3-graphviz openbox obconf libopenbox obmenu-generator pcmanfm lightdm lxdm lightdm-gtk3-greeter xfdesktop

sudo xbps-remove -yO
sudo xbps-remove -yo
sudo vkpurge rm all
