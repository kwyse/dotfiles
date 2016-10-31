if &compatible
  set nocompatible
endif

set runtimepath+=$XDG_CONFIG_HOME/nvim/.plugins/repos/github.com/Shougo/dein.vim

call dein#begin('$XDG_CONFIG_HOME/nvim/.plugins')

call dein#add('airblade/vim-gitgutter')
call dein#add('joshdick/onedark.vim')
call dein#add('mhartington/oceanic-next')
call dein#add('neomake/neomake')
call dein#add('rust-lang/rust.vim')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('vim-airline/vim-airline')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme OceanicNext

set number relativenumber

let g:airline_theme='oceanicnext'
let g:deoplete#enable_at_startup=1

let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/local/repo/rust/src'
"let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20
