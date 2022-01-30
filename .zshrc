# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marcioc/.zshrc'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' file-list all




autoload -U compinit promptinit
compinit 
promptinit; prompt adam2

alias cat='bat'
alias ls='exa -lxFahS'
alias grep='rg'

setxkbmap br dvorak

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
