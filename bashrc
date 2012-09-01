files_to_load=(
	~/dotfiles/bash/aliases
	~/dotfiles/bash/ui
	~/dotfiles/functions.sh
	`brew --prefix`/etc/bash_completion
)

for file in ${files_to_load[@]}; do
	[[ -s $file ]] && . $file
done

# rbenv
eval "$(rbenv init -)"

export PATH=~/bin:$PATH
export CDPATH=.:~
