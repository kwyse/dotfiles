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
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
call plug#end()

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
set background=dark             " Adjust colors for a dark background

colorscheme molokai

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
