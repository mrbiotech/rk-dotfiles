#!/bin/sh

if test -f "exa"; then
    alias l="exa -ahlFG"
else
    alias l="ls -ahlFG"
fi
alias randompassword="date +%s | gsha256sum | base64 | head -c 12 ; echo"
alias servethis="python -m http.server 5150"
alias printcsv='cat $1 | sed -e "s/,,/, ,/g" | column -s, -t | less -#5 -N -S'

# Docker aliases
alias dockersh='f() { docker exec -it $1 sh };f'
alias dockerbash='f() { docker exec -it $1 bash};f'
alias dockerdestroy='docker ps -aq | xargs -I {} docker rm {}'
alias dockerdestroyimages='docker image ls -q | xargs -I {} docker image rm {}'
alias dockerdestroythis='docker ps -aq -f name=$1 | xargs -I {} docker rm {}'
alias dockerkill='dockerstop && dockerdestroy && docker volume prune -f'
alias dockerls='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}"'
alias dockerstop='docker ps -q | xargs -I {} docker stop {}'
alias dockerup='docker-compose up -d'

# vim: set ts=8 sw=4 tw=0 nowrap :
