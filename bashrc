. ~/dotfiles/bash/aliases
. ~/dotfiles/bash/ui
which brew > /dev/null && . `brew --prefix`/etc/bash_completion

if test -d ~/.rbenv; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
