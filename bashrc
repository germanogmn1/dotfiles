[[ -s ~/dotfiles/bash/aliases ]] && . ~/dotfiles/bash/aliases
[[ -s ~/dotfiles/bash/ui ]] && . ~/dotfiles/bash/ui

which -s npm && export PATH="`npm bin`:$PATH" # node package manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s `brew --prefix`/etc/bash_completion ]] && . `brew --prefix`/etc/bash_completion