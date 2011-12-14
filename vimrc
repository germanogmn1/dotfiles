set nocompatible
syntax on

set number
set ruler

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase " Case sensitive if regexp contains a capital letter

" Default indentation
set ts=4 sts=4 sw=4 noet ai

" Indentation by file type
if has("autocmd")
	filetype on
	autocmd FileType ruby,eruby,javascript,yaml setlocal ts=2 sts=2 sw=2 et
endif

" Show hiddens
set list
set listchars=tab:▸\ ,eol:¬

" Plugins
runtime autoload/*.vim
