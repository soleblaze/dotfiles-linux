#!/bin/zsh

# Override Commands
alias cp="cp -i --reflink=auto"
alias dosbox=dosbox -conf "$XDG_CONFIG_HOME"/dosbox/dosbox.conf
alias free="free -h"
alias grep="grep --color -i"
alias ls="ls --color=always --group-directories-first"
alias ping='prettyping --nolegend'
alias vi=nv
alias wget=wget --hsts-file="$HOME/.local/share/wget-hsts"

# BTRFS DF alias
alias bdf="btrfs filesystem df"

# Ripgrep Aliases
alias rg="batgrep -S"
alias rgi="batgrep -i"
alias rgs="batgrep -s"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias open="xdg-open"
alias sih="sudo -i -H"
alias svi="sudo -e"
alias sz="source ~/.zshrc"
alias xd="xdg-mime default"
alias xqd="xdg-mime query default"
alias xqf="xdg-mime query filetype"

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# ssh aliases
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias sshnhr='ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'

# dot aliases
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# archlinux aliases
alias pac="sudo pacman -S"
alias pacq="pacman -Q"
alias pacr="sudo pacman -Rs"
alias pacs="pacman -Ss"
alias pacsy="sudo pacman -Sy"
alias pacsyu="sudo pacman -Syu"
alias pacu="sudo pacman -U"
alias pacz="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pacrz="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias ya="yay -S"
alias yas="yay -Ss"
alias yau="yay -Su"

# BTRFS DF alias
alias bdf="btrfs filesystem df"

# nap aliases
alias napclip='nap $(nap list | gum filter) | xclip -selection clipboard'
alias napexec='nap $(nap list | gum filter) | bash'
alias napsave='gum write | nap $(gum input --placeholder folder/snippet.ext)'
