# ------------------------------
# General Settings
# ------------------------------
 
# vim kaoriya
#export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Glob ###
# HEAD^が使えなくなるのでコメントアウト
#setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

# improve cd
setopt auto_cd
setopt auto_pushd
# ^でcd ..する
function cdup() {
echo
cd ..
zle reset-prompt
}
zle -N cdup

# improve input
setopt correct
setopt list_packed

# エラーメッセージ本文出力に色付け
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

autoload bashcompinit
bashcompinit

for conf (~/Private/dotfiles/.zsh/lib/*.zsh) source $conf


# powerline
function powerline_precmd() {
    export PS1="$(~/powerline-shell.py $? --shell zsh)"
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

#install_powerline_precmd

export PATH=/usr/local/bin:$PATH

#nvm
#source $HOME/.nvm/nvm.sh

# ls
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# history
alias history="history -i"
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# fastlane
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Android
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK/emulator
export PATH=$PATH:$ANDROID_SDK/platform-tools

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RBENV_ROOT="$HOME/.rbenv"
if [ -d $RBENV_ROOT ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Load .bash_profile for secure info
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi
