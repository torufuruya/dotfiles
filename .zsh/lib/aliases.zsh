setopt complete_aliases # aliased ls needs if file/dir completions work

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

alias where="command -v"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -al"
alias sl=ls # often screw this up

# git
alias gs='git status'
alias gd='git diff --color'

# log
alias plog='tail -f /var/log/apache2/error_log'
alias alog='tail -f /var/log/apache2/access_log'

# Dock restart
alias kd='killall Dock'
