" Intro ------------------------------------------------------------- {{
" ======================================================================
" vim: set sw=2 ts=2 sts=2 et tw=72 nospell:
" vim: set foldmethod=marker foldmarker={{,}} foldlevel=0:
"
"  __                                                     .__
" |  | ____  _  __ ___.__.  ______  ____           ___  __|__|  _____
" |  |/ /\ \/ \/ /<   |  | /  ___/_/ __ \   ______ \  \/ /|  | /     \
" |    <  \     /  \___  | \___ \ \  ___/  /_____/  \   / |  ||  Y Y  \
" |__|_ \  \/\_/   / ____|/____  > \___  >           \_/  |__||__|_|  /
"      \/          \/          \/      \/                           \/
"
" Maintainer: Krishan Wyse <kwysek@gmail.com>
"
" ------------------------------------------------------------------- }}
" Setup ------------------------------------------------------------- {{
" ======================================================================

set nocompatible                " Enable incompatibility mode with vi

" Speed up start-up time
let g:ruby_path = system('rvm current')

" Vundle core
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle plugins
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'ap/vim-css-color'
Bundle 'bling/vim-airline'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'gerw/vim-HiLinkTrace'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/gitv'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'kana/vim-textobj-user'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'nelstrom/vim-qargs'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'

" Vim distribution plugins
runtime macros/matchit.vim      " Enable matchit.vim

filetype plugin indent on       " Re-enable after Vundle core

" ------------------------------------------------------------------- }}
" Interface --------------------------------------------------------- {{
" ======================================================================

set ruler                       " Always show current cursor position
set number                      " Enable line numbers
set cmdheight=1                 " Set the height of the command bar
set laststatus=2                " Always display the status line
set showtabline=0               " Remove tab bar
set ignorecase smartcase        " Case-sense if searching with capitals
set infercase                   " Adjust case when autocompleting
set hlsearch incsearch          " Enable highlight and instant search
set magic                       " Turn magic on for regular expressions
set showmatch                   " Show matching braces
set mat=2                       " Matching bracket blink timeout
set noeb novb t_vb= tm=500      " Disable error beeping
set hidden                      " Enable automatic hiding of buffers
set history=768                 " Lines of history to remember
set shell=zsh                   " Set zsh as the default shell
set mousehide                   " Hide mouse cursor while typing
set tabpagemax=10               " Set a maximum of 10 tab pages
set showmode                    " Display current mode
set cursorline                  " Highlight the current cursor line
set linespace=0                 " Disallow extra line space between rows
set spelllang=en_gb             " Set spell checker to British English

set expandtab smarttab          " Use spaces instead of tabs
set sw=2 ts=2 sts=2             " Set tab width
set formatoptions+=cqt          " Specify format options
set formatprg=par               " Set 'par' as the external formatter
set autoindent smartindent      " Enable smart indentation
set wrap linebreak nolist       " Enable soft word wrapping
set nrformats=                  " All numerals treated as decimal
set listchars=tab:▸\ ,eol:¬     " Use TextMate tab and EOL symbols
set backspace=eol,start,indent  " Configure Backspace to work correctly
set whichwrap+=b,s,<,>,h,l,[,]  " Wrap around line beginnings/endings

syntax enable                   " Enable syntax highlighting
colorscheme solarized           " Set color scheme
set background=dark
if has("gui_running")           " Set GUI specific options
  set guifont=Inconsolata:h13   " Set font
  set guioptions-=Lr            " Remove scrollbars
  set guioptions-=T             " Remove toolbar
  set guioptions+=e             " Enable tab pages
  set t_Co=256                  " Set terminal colour
  set guitablabel=%M\ %t        " Tab label format
endif

" ------------------------------------------------------------------- }}
" File operations --------------------------------------------------- {{
" ======================================================================

set enc=utf8 fenc=utf-8 tenc=utf-8  " Set encoding
set ffs=unix                        " Set standard file format
set nobackup nowb noswapfile        " Disable backups
set wildignore=*.o,*~               " Ignore compiled and copy files
set wildmenu wildmode=full          " Enable zsh-like autocompletion
set autoread                        " Auto-read external changes

if has("autocmd")
  filetype on                       " Enable file type detection

  " Re-source vimrc on save
  autocmd! BufWritePost .vimrc source $MYVIMRC

  " Highlight trailing whitespaces
  highlight TrailingWhitespace ctermbg=red guibg=red
  match TrailingWhitespace /\s\+$/
  autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
  autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match TrailingWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " Highlight right margin
  highlight ColorColumn ctermbg=235 guibg=#333333

  " Set file types for unrecognised extensions
  autocmd BufRead,BufNewFile *.txt setfiletype text

  " Enable file type-specific formatting
  autocmd Filetype gitcommit setlocal tw=72 spell
  autocmd Filetype java setlocal ts=4 sts=4 sw=4 noet
  autocmd Filetype make setlocal ts=2 sts=2 sw=2 noet
  autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
  autocmd Filetype ruby setlocal tw=80 ts=2 sts=2 sw=2 et cc=81
  autocmd Filetype tex setlocal tw=72 spell
  autocmd Filetype text setlocal tw=72 spell fo+=a
  autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 et
endif

" ------------------------------------------------------------------- }}
" Key mappings ------------------------------------------------------ {{
" ======================================================================

" Display the help prompt
nnoremap <leader>h :help 

" Toggle tab display
nnoremap <silent> <leader>' :call TabLineToggle()<CR>

" Toggle colour column
nnoremap <silent> <leader>coo :call g:ColorColumnToggle()<CR>

" Use very magic regex by default
nnoremap / /\v
vnoremap / /\v

" Fix spelling mistakes in quick succession, assuming first correction
nmap <leader>. ]s1z=

" Easily edit .vimrc file
nmap <leader>vrc :tabe $MYVIMRC<CR>

" Add '%%' to expand to the path of the active buffer for Ex commands
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Add mappings to open files faster
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Enable more efficient history scrolling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Remove highlighted search matches
nnoremap <silent> <C-[> :noh<CR><C-[>

" Display word count for buffer
nmap <leader>wc :%s/\v\w+//gn<CR><C-[>

" Display word count for searches
nmap <leader>ws :%s///gn<CR><C-[>

" Set '&' to include flags from previous substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Switch to header/source file
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" Generate ctags index
nnoremap <f5> :!ctags -R<CR>

" View previous search term occurrence centred
noremap <silent>n nzz
noremap <silent>N Nzz

" Set window-switching convenience commands
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Allow forward traversal through tag history
" nnoremap <C-S-t> :tag<CR>

" Enable easier tab switching
noremap <leader>[ gt
noremap <leader>] gT
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
noremap <leader>` :tabclose<CR>

" ------------------------------------------------------------------- }}
" Plugin options ---------------------------------------------------- {{
" ======================================================================

" hexhighlighter
nmap <leader>hh :call HexHighlight()<Return>

" gundo
nnoremap <leader>gun :GundoToggle<CR>

" nerdtree
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
nnoremap <silent> <leader>se :Errors<CR>

" vim-airline
let g:airline_theme = 'solarized'

" vim-fugitive
nnoremap <silent> <leader>gco :Gcommit<CR>
nnoremap <silent> <leader>gph :Git push<CR>
nnoremap <silent> <leader>gst :Gstatus<CR>

" vim-unimpaired
vmap [e [egv
vmap ]e ]egv


" ------------------------------------------------------------------- }}
" Helper functions -------------------------------------------------- {{
" ======================================================================

function! TabLineToggle()
  if &showtabline
    set showtabline=0
  else
    set showtabline=2
  endif
endfunction

function! g:ColorColumnToggle()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction

" ------------------------------------------------------------------- }}
