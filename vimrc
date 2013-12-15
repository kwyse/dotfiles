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

" Vundle core
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle plugins
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'

" Vim distribution plugins
runtime macros/matchit.vim      " Enable matchit.vim

filetype plugin indent on       " Enable file type plugins

" ------------------------------------------------------------------- }}
" Interface --------------------------------------------------------- {{
" ======================================================================

set ruler                       " Always show current cursor position
set number                      " Enable line numbers
set cmdheight=1                 " Set the height of the command bar
set laststatus=2                " Always display the status line
set ignorecase smartcase        " Case-sense if searching with capitals
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

set expandtab smarttab          " Use spaces instead of tabs
set sw=2 ts=2 sts=2             " Set tab width
set autoindent smartindent      " Enable smart indentation
set wrap                        " Enable word wrap
set nrformats=                  " All numerals treated as decimal
set listchars=tab:▸\ ,eol:¬     " Use TextMate tab and EOL symbols
set backspace=eol,start,indent  " Configure Backspace to work correctly
set whichwrap+=b,s,<,>,h,l,[,]  " Wrap around line beginnings/endings

syntax enable                   " Enable syntax highlighting
colorscheme molokai             " Set color scheme
if has("gui_running")           " Set GUI specific options
  g:molokai_original == 1       " Enable alternate molokai BG color
  set guioptions-=r             " Remove scrollbar
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
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et cc=80
  autocmd Filetype tex setlocal tw=72 spell
  autocmd Filetype text setlocal tw=72 spell
  autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 et
endif

" ------------------------------------------------------------------- }}
" Key mappings ------------------------------------------------------ {{
" ======================================================================

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

" Switch to header/source file
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" Generate ctags index
nnoremap <f5> :!ctags -R<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to view previous search term occurrence centred
noremap <leader>n nzz

" Set window-switching convenience commands
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Enable easier tab switching
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" ------------------------------------------------------------------- }}
" Plugin options ---------------------------------------------------- {{
" ======================================================================

" nerdtree
map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers=['mri', 'rubocop']

" vim-airline
let g:airline_theme = 'molokai'

" vim-fugitive
nnoremap <silent> <leader>gco :Gcommit<CR>
nnoremap <silent> <leader>gph :Git push<CR>
nnoremap <silent> <leader>gst :Gstatus<CR>

" ------------------------------------------------------------------- }}
" Helper functions -------------------------------------------------- {{
" ======================================================================

" ------------------------------------------------------------------- }}

