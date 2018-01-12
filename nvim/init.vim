if &compatible
  set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('autozimu/LanguageClient-neovim')
  call dein#add('cespare/vim-toml')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('ElmCast/elm-vim')
  call dein#add('joshdick/onedark.vim')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('mhartington/oceanic-next')
  call dein#add('rust-lang/rust.vim')
  " call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('w0rp/ale')
  call dein#add('wavded/vim-stylus')
  call dein#add('vim-airline/vim-airline')

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

" set background=dark
colorscheme OceanicNext

set number relativenumber
set expandtab shiftwidth=2 smarttab
set noswapfile

let g:airline_theme='oceanicnext'
let g:deoplete#enable_at_startup=1

" let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/usr/local/repo/rust/src'
" "let g:deoplete#sources#rust#disable_keymap=1
" let g:deoplete#sources#rust#documentation_max_height=20

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>

autocmd FileType markdown setlocal textwidth=80
autocmd BufWritePre markdown gqap

nmap <silent> <C-p> :Files<CR>

let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

