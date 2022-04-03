#!/bin/sh

if test -f "~/.pekwm/app-menu"; then
  rm -rf "~/.pekwm/app-menu"
fi
mmaker -ic -t Sakura PekWM > ~/.pekwm/app-menu
