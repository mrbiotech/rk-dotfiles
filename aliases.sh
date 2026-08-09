#!/bin/sh

<<<<<<< HEAD
[[ -x `which eza` ]] && alias l='eza -ahlF auto'
[[ -x `which eza` ]] && alias lg='eza -ahlF auto --git'
[[ -x `which eza` ]] && alias lr='eza -ahlF auto --git -s modified'
[[ -x `which eza` ]] && alias lc='eza -ahlF auto --git -s created'
[[ -x `which eza` ]] && alias lcd='eza -ahloF auto --git --loc --icons'
[[ -x `which eza` ]] && alias lt='eza -T --loc --icons --git'
[[ -x `which eza` ]] && alias lsum='eza --code --icons'
=======
[[ -x `which eza` ]] && alias l='eza -ahlF --classify=auto'
>>>>>>> editors
[[ -x !(`which eza`) ]] && alias l='ls -ahlFG'

alias sql='sqlite3'
alias todo='f() {nohup emacs $ORGTODO > /dev/null 2>&1 & };f'
alias todoterm='emacs -nw $ORGTODO'
alias open='explorer.exe'
alias python='python3'
alias doglog="git log --all --decorate --oneline --graph"
alias uvr='uv run'
alias uva='uv add'
alias uvs='uv sync'

alias randompassword="date +%s | gsha256sum | base64 | head -c 12 ; echo"
alias servethis="python -m http.server 5150"
alias printcsv='cat $1 | sed -e "s/,,/, ,/g" | column -s, -t | less -#5 -N -S'
alias whichdistro='lsb_release -d'

alias chrome='$BROWSER'

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

# Other helper functions
extract-palette() { convert "$1" -resize 300x -dither None -colors "$2" txt: | tail -n +2 | tr -s ' ' | cut -d ' ' -f 3 | sort | uniq -c | sort -rn | tr -s ' ' | cut -d ' ' -f 3;}
addh1() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "# $1\n" >> $2
}
addh2() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "\n\n## $1\n" >> $2
}
addh3() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "\n\n### $1\n" >> $2
}
addh4() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "\n\n#### $1\n" >> $2
}
addh5() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "\n\n##### $1\n" >> $2
}
addh6() {
    if [[ ! -x "$2" ]]; then
        touch "$2"
    fi
    echo "\n\n###### $1\n" >> $2
}

# vim: set ts=8 sw=4 tw=0 nowrap :
