. ~/dotfiles/bash/aliases
. ~/dotfiles/bash/ui
which brew > /dev/null && . `brew --prefix`/etc/bash_completion

if which rbenv > /dev/null; then
	eval "$(rbenv init -)"
	export PATH="$HOME/.rbenv/bin:$PATH"
fi
