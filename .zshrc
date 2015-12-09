export EDITOR=vim
bindkey -e

autoload zed

export LANG=ja_JP.UTF-8

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt complete_aliases

#alias
alias ls='ls --color=auto'
alias emacs='emacs -nw'

#compinit
autoload -U compinit
compinit

#color
autoload -U colors; colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#prompt
PROMPT="%{${fg[green]}%}[%m@%n]%# %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,w]: %{${reset_color}%}"

#lein
export PATH=$HOME/local/bin:$PATH
