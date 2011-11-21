files_to_load=(
  ~/dotfiles/bash/aliases
  ~/dotfiles/bash/ui
  `brew --prefix`/etc/bash_completion
)

for file in ${files_to_load[@]}; do
  [[ -s $file ]] && . $file
done

which -s npm && export PATH="`npm bin`:$PATH" # node package manager
