"
" -- vimrc ------------------------------------------------------------
" Maintainer: Krishan Wyse <kwysek@gmail.com> -------------------------
" ---------------------------------------------------------------------
"
" This is my personal vimrc file. It relies on vim-plug to manage plugins and
" vim-plug will need to be initialised manually prior to use. Follow the
" instructions available at https://github.com/junegunn/vim-plug for details.
"
" Contents:
" -- Plugins
" -- Options
" -- Key bindings
"
" -- Plugins ----------------------------------------------------------
" ---------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'ntpeters/vim-better-whitespace'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()
let g:base16colorspace=256

" -- Options ----------------------------------------------------------
" ---------------------------------------------------------------------
set nocompatible                " Disable vi compatibility
set number relativenumber       " Enable line numbering
set ignorecase smartcase        " Case-sensitive search if capitals included
set infercase                   " Ignore case when autocompleting
set hlsearch                    " Enable highlighting on searches
set showmatch                   " Show matching brace briefly when inserting
set noerrorbells novisualbell   " Disable error beeping
set hidden                      " Hide buffers when unloading them
set spelllang=en_gb,en_us       " Set spell checker language preferences
set noswapfile                  " Prevent swapfile clutter

" Default to 2-space indentation
set tabstop=2 shiftwidth=2 expandtab

set background=dark
colorscheme base16-atelierforest

if has("autocmd")
  autocmd! BufWritePost .vimrc source $MYVIMRC " Re-source vimrc on save
endif

" -- Key bindings -----------------------------------------------------
" ---------------------------------------------------------------------
function! ToggleWordWrap()
  if &formatoptions =~ 'a'
    setlocal formatoptions-=a
    echo "Paragraph auto-formatting disabled"
  else
    setlocal formatoptions+=a
    echo "Paragraph auto-formatting enabled"
  endif
endfunction
nnoremap <leader>ww :call ToggleWordWrap()<CR>

" Use very magic regex by default
nnoremap / /\v
vnoremap / /\v

" Expand to the path of the active buffer for Ex commands
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Open new buffers faster
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" View previous search term occurrence centered
noremap <silent>n nzz
noremap <silent>N Nzz

" Set window-switching convenience commands
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move cursor via display lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" ---------------------------------------------------------------------
" ---------------------------------------------------------------------

let g:ycm_global_ycm_extra_conf = '~/.vim/config/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1, 'python': 1 }
