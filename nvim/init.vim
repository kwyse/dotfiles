set nocompatible
set guioptions=M

packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('autozimu/LanguageClient-neovim', {'do': '!bash install.sh'})
  call minpac#add('octol/vim-cpp-enhanced-highlight')
  call minpac#add('rakr/vim-one')
  call minpac#add('radenling/vim-dispatch-neovim')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('w0rp/ale')
endif

filetype plugin indent on
syntax enable

command! PackageUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackageClean packadd minpac | source $MYVIMRC | call minpac#clean()

if (has("termguicolors"))
  set termguicolors
endif

let g:one_allow_italics = 1
set background=dark
colorscheme one

set number relativenumber
set noswapfile
set hidden
set backspace=indent,eol,start

set path+=**
set wildmenu
set wildmode=list:longest,full
