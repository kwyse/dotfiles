" Intro ------------------------------------------------------------- {{
" ======================================================================
" vim: set sw=2 ts=2 sts=2 et tw=72:
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

" Speed up start-up time
let g:ruby_path = system('rvm current')

" NeoBundle core
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ap/vim-css-color'
NeoBundle 'bling/vim-airline'
" NeoBundle 'bling/vim-bufferline'
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'gerw/vim-HiLinkTrace'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gregsexton/gitv'
NeoBundle 'honza/vim-snippets'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'kana/vim-textobj-user'
" NeoBundle 'lervag/vim-latex'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \   'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak'
      \   },
      \ }
" NeoBundle 'SirVer/ultisnips'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
" NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/a.vim'

" Vim distribution plugins
runtime macros/matchit.vim      " Enable matchit.vim

filetype plugin indent on       " Re-enable after NeoBundle core
NeoBundleCheck

" ------------------------------------------------------------------- }}
" Interface --------------------------------------------------------- {{
" ======================================================================

set t_ut=                       " Play nice with tmux
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
set linespace=0                 " Disallow extra line space between rows
set spelllang=en_gb             " Set spell checker to British English

set expandtab smarttab          " Use spaces instead of tabs
set sw=2 ts=2 sts=2             " Set tab width
set formatoptions+=cqt          " Specify format options
set formatprg=par               " Set 'par' as the external formatter
set completeopt-=preview        " Disable preview window
set autoindent smartindent      " Enable smart indentation
set wrap linebreak nolist       " Enable soft word wrapping
set nrformats=                  " All numerals treated as decimal
set listchars=tab:▸\ ,eol:¬     " Use TextMate tab and EOL symbols
set backspace=eol,start,indent  " Configure Backspace to work correctly
set whichwrap+=b,s,<,>,h,l,[,]  " Wrap around line beginnings/endings
set omnifunc=syntaxcomplete#Complete

syntax enable                   " Enable syntax highlighting
colorscheme solarized           " Set color scheme
if has("gui_running")           " Set GUI specific options
  set guifont=Inconsolata:h13   " Set font
  set guioptions-=rL            " Remove scrollbars
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
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o

  " Set file types for unrecognised extensions
  autocmd BufRead,BufNewFile *.txt setfiletype text

  " Enable file type-specific formatting
  autocmd Filetype gitcommit setlocal tw=72 spell
  autocmd Filetype cpp setlocal commentstring=\/\/\ %s
  autocmd Filetype java setlocal ts=4 sts=4 sw=4 noet
  autocmd Filetype make setlocal ts=2 sts=2 sw=2 noet
  autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
  autocmd Filetype ruby setlocal tw=80 ts=2 sts=2 sw=2 et
  autocmd Filetype tex setlocal spell makeprg=pdflatex\ -shell-escape\ %
  autocmd Filetype text setlocal tw=72
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

" Dismiss quickfix and location lists
nnoremap <silent> <leader>- :cclose<CR>:lclose<CR>
nnoremap <silent> <leader>= :copen<CR>

" Toggle word wrap
nnoremap <leader>ww :call ToggleWordWrap()<CR>

" Use very magic regex by default
nnoremap / /\v
vnoremap / /\v

" Toggle folds quicker
nnoremap <Space> za

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
" nnoremap <silent> <C-[> :noh<CR><C-[>

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

map <leader>bp :lcd %% \| mak<CR>
map <leader>bb :ProjectRootCD<CR>:mak<CR>
map <leader>bc :ProjectRootCD<CR>:mak clean<CR>
map <leader>br :ProjectRootCD<CR>:mak<CR>:!%%%:r<CR>

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" ------------------------------------------------------------------- }}
" Plugin options ---------------------------------------------------- {{
" ======================================================================

" airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" alternate
nnoremap <silent> <leader>aa :A<CR>

" gundo
nnoremap <leader>gun :GundoToggle<CR>

" nerdcommenter
let NERDSpaceDelims=1

" nerdtree
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" signify
let g:signify_vcs_list = [ 'git' ]

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_cpp_checkers=['gcc', 'oclint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '*'
let g:syntastic_style_warning_symbol = '?'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler = 'clang++'
nnoremap <silent> <leader>se :Errors<CR>

" ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"

" unite
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
endif

" vim-airline
let g:airline_theme = 'solarized'

" vim-fugitive
nnoremap <silent> <leader>gco :Gcommit<CR>
nnoremap <silent> <leader>gph :Git push<CR>
nnoremap <silent> <leader>gst :Gstatus<CR>

" vim-unimpaired
vmap [e [egv
vmap ]e ]egv

" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/bin/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0

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

function! ToggleWordWrap()
  if &formatoptions =~ 'a'
    setlocal formatoptions-=a
  else
    setlocal formatoptions+=a
  endif
endfunction

" ------------------------------------------------------------------- }}
