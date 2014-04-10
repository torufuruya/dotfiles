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
alias ga='git add'
alias gl='git pull'
alias gp='git push'
alias gd='git diff --color'
alias gdc='git diff --cached --color'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias glog="git log --graph --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(black bold)%an, %C(red)%ar%Creset'"

# log
alias plog='tail -f /var/log/apache2/error_log'
alias alog='tail -f /var/log/apache2/access_log'

# Dock restart
alias kd='killall Dock'
