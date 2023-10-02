#!/bin/sh

[[ -x `which exa` ]] && alias l='exa -ahlFG'
[[ -x !(`which exa`) ]] && alias l='ls -ahlFG'

alias randompassword="date +%s | gsha256sum | base64 | head -c 12 ; echo"
alias servethis="python3 -m http.server 5150"
alias printcsv='cat $1 | sed -e "s/,,/, ,/g" | column -s, -t | less -#5 -N -S'
alias bat='batcat'
alias feh='feh --conversion-timeout 3'
alias sql='sqlite3'
alias todo='emacs -nw /mnt/c/Users/RichKulesus/Documents/ORG/WMG-TODOs.org'
alias todoterm='emacs -nw /mnt/c/Users/RichKulesus/Documents/ORG/WMG-TODOs.org'

# Docker aliases
# alias dockersh='f() { docker exec -it $1 sh };f'
# alias dockerbash='f() { docker exec -it $1 bash};f'
# alias dockerdestroy='docker ps -aq | xargs -I {} docker rm {}'
# alias dockerdestroyimages='docker image ls -q | xargs -I {} docker image rm {}'
# alias dockerdestroythis='docker ps -aq -f name=$1 | xargs -I {} docker rm {}'
# alias dockerkill='dockerstop && dockerdestroy && docker volume prune -f'
# alias dockerls='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}"'
# alias dockerstop='docker ps -q | xargs -I {} docker stop {}'
# alias dockerup='docker-compose up -d'

# vim: set ts=8 sw=4 tw=0 nowrap :
