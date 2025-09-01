export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jtriley"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

plugins=(git)

source $ZSH/oh-my-zsh.sh

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

rangercd() {
    temp_file="$(mktemp -t "rangercd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

eval $(thefuck --alias)

export PATH=$PATH:/home/zxcynical/.cargo/bin

alias fetch="fastfetch --logo $HOME/.config/fastfetch/logo.txt"
#alias fetch="fastfetch --logo arch3"
alias lsd="lsd -al"
alias ranger="rangercd"
alias clear="clear;fetch"

fetch
