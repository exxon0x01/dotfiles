export EDITOR=vim
bindkey -v

autoload zed

#keybind
export LANG=ja_JP.UTF-8

#option
setopt print_eight_bit
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt complete_aliases
setopt extended_glob
setopt prompt_subst
setopt nolistbeep

#history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#alias
case "${OSTYPE}" in
		darwin*)
				alias ls='ls -GF'
				;;
		linux*)
				alias ls='ls -F --color=auto'
				;;
esac
alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias sudo='sudo '
 
alias emacs='emacs -nw'

#compinit
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#color
autoload -U colors; colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export TERM="xterm-256color"

#prompt
PROMPT="%{${fg[green]}%}[%m@%n]%# %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,w]: %{${reset_color}%}"

#vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
