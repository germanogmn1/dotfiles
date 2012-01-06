files_to_load=(
  ~/dotfiles/bash/aliases
  ~/dotfiles/bash/ui
  `brew --prefix`/etc/bash_completion
)

for file in ${files_to_load[@]}; do
  [[ -s $file ]] && . $file
done

# rbenv
eval "$(rbenv init -)"

# node package manager
#which -s npm && export PATH="`npm bin`:$PATH"
