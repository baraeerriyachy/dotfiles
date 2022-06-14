# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT="%B[%F{green}%n%f%F{green}@%F{green}%m%f%F{blue} %~%f%]]$%b "

alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# zsh syntax highlighting
source /home/barae/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
