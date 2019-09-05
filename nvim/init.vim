" set runtimepath+=$XDG_CONFIG_HOME/nvim/.plugins/repos/github.com/Shougo/dein.vim

" call dein#begin('$XDG_CONFIG_HOME/nvim/.plugins')

" call dein#add('airblade/vim-gitgutter')
" call dein#add('joshdick/onedark.vim')
" call dein#add('mhartington/oceanic-next')
" call dein#add('neomake/neomake')
" call dein#add('rust-lang/rust.vim')
" call dein#add('sebastianmarkow/deoplete-rust')
" call dein#add('Shougo/dein.vim')
" call dein#add('Shougo/deoplete.nvim')
" call dein#add('vim-airline/vim-airline')

" call dein#end()

" filetype plugin indent on
syntax enable

" if dein#check_install()
  " call dein#install()
" endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme one
set background=dark

set number relativenumber
set ignorecase smartcase
set infercase
set showmatch
set hidden
set noswapfile

set tabstop=2 shiftwidth=2 expandtab
set numberwidth=4


let g:deps = []
call add(deps, 'rakr/vim-one')
call add(deps, 'tpope/vim-commentary')
" call add(deps, 'rust-lang/rust.vim')

function! s:clone()
  for dep in g:deps
    echo 'Cloning ' . dep
    silent call system(
      \'git clone https://github.com/' . dep .
      \' ~/.local/share/nvim/site/pack/packages/start/' . split(dep, "/")[1] .
      \' || true')
  endfor
endfunction

command! PackageClone call s:clone()
