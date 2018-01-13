set nocompatible
set guioptions=M

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('junegunn/fzf')
  call dein#add('rust-lang/rust.vim')

  " TODO: This doesn't work when switching to another file via fzf
  " call dein#add('junegunn/fzf', { 'on_map': {'n': '<C-p>'} })

  call dein#add('hzchirs/vim-material')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme vim-material

set number relativenumber
set noswapfile
set hidden
set backspace=indent,eol,start

set path+=**
set wildmenu
set wildmode=list:longest,full
