# PATH
export PATH=/usr/local/bin:$PATH

# 自動補完
autoload -U compinit; compinit

# ディレクトリ直移動
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

# ls拡張
alias ll='ls -l'
alias la='ls -a'

# Global alias for peco
alias -g P='| peco'
# dirをスタック
setopt auto_pushd
setopt pushd_ignore_dups

# command履歴設定
setopt hist_ignore_all_dups
setopt hist_ignore_space

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1


# 上Ver.
# PROMPT="%F{yellow}ζ*'ヮ')ζ%f< %F{cyan}%~%f
# > "

PROMPT="%F{cyan}[%~]%f
%F{yellow}ζ*'ヮ')ζ%f < "

# yayoi
function yayoi() {
	serif=("うっう〜" "にょー" "ゆめをみてれぅ～" "かまげぇぇぃんっ!" "はーん")
	echo $RANDOM > /dev/null
	echo "ζ*'ヮ')ζ <" $serif[$(expr $RANDOM % 5 + 1)]
}


# alias
alias cls='clear'
alias la="ls -a"
alias ll="ls -l"
alias vim='nvim'
alias chrome="open -a /Applications/Google\ Chrome.app"
alias safari="open -a /Applications/Safari.app"
alias macdown="open -a /Applications/MacDown.app $1"
alias subl="open -a /Applications/Sublime\ Text.app $1"

# VS code
code () {
    [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
    open -a "Visual Studio Code" --args "$F"
}

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# NeoVim
export XDG_CONFIG_HOME=~/.config

# Enhancd
source ~/.enhancd/init.sh
ENHANCD_FILTER="peco:fzf"; export ENHANCD_FILTER 


### peco functions ###[<64;95;22M[<64;95;22M[<64;95;22M

# select command from history 
function peco-select-history() {
	BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
	CURSOR=$BUFFER
	zle -R -c
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# search and open by vim
function peco-hw-vim() {
	if
	local filepath=$(hw $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
	if [ ! -z "$filepath" ] ; then
		vim "$filepath" 
	fi
}
alias hwvim='peco-hw-vim'

