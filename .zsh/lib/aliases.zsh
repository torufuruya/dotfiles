setopt complete_aliases # aliased ls needs if file/dir completions work

alias _='sudo' # Super user

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

alias where="command -v"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias sl=ls # often screw this up

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias afind='ack-grep -il'

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -G -w"
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;
esac

# git
alias gs='git status'
alias gd='git diff'

