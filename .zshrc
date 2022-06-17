zstyle ':completion:*' rehash true
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

PROMPT="%B%F{11}(%f%b%F{cyan}%~%f%B%F{11})%f%b%F{cyan}-%f%B%F{blue}>%f%b%F{green}>%f%B%F{yellow}>%f%b "
RPROMPT=" "

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

