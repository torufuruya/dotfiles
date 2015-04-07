# ------------------------------
# General Settings
# ------------------------------
 
# vim kaoriya
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

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

for conf (~/dotfiles/.zsh/lib/*.zsh) source $conf


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

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
if [ -d $RBENV_ROOT ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi
