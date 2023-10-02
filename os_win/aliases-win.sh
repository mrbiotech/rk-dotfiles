#!/bin/sh
export $WINHOME=`wslpath "$(wslvar USERPROFILE)"`
alias todo='emacs -nw /mnt/c/Users/$WINHOME/Dropbox/org/TODO.org'
alias sublime="sublime_text.exe $1"
