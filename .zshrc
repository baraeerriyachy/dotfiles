# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

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

# vi mode
bindkey -v
KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT="[%B%F{green}%n%f%F{green}@%F{green}%m%f%F{blue} %~%b%f%]]%F{yellow}%B$%b ";;
        (main|viins) PROMPT="[%B%F{green}%n%f%F{green}@%F{green}%m%f%F{blue} %~%b%f%]]%B$%b ";;
        (*)          PROMPT="[%B%F{green}%n%f%F{green}@%F{green}%m%f%F{blue} %~%b%f%]]%B$%b ";;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# zsh syntax highlighting
source /home/barae/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
