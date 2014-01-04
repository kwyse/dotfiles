" Rescind - a Vim color scheme
"
" Author: Krishan Wyse

hi clear
set background=dark
if version > 580
  if exists("syntax_on")
      syntax reset
  endif
endif

runtime colors/molokai.vim
let g:colors_name="take_us_back"

hi  Boolean       guifg=#AE81FF  ctermfg=141   guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Character     guifg=#D7D700  ctermfg=184   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Comment       guifg=#465457  ctermfg=239   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Conditional   guifg=#D60C60  ctermfg=161   guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Constant      guifg=#AE81FF  ctermfg=141   guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Cursor        guifg=#000000  ctermfg=16    guibg=#F8F8F8  ctermbg=231   gui=NONE       cterm=NONE
hi  Define        guifg=#2F8EE0  ctermfg=32    guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Directory     guifg=#2F8EE0  ctermfg=32    guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Delimeter     guifg=#DBDBDB  ctermfg=253   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Function      guifg=#14ABB3  ctermfg=37    guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Identifier    guifg=#D75F00  ctermfg=166   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  DiffAdd       guifg=#00AF00  ctermfg=34    guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  DiffChange    guifg=#FFFF00  ctermfg=226   guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  DiffDelete    guifg=#D70000  ctermfg=160   guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  DiffText      guifg=#465457  ctermfg=239   guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  SignColumn    guifg=#465457  ctermfg=239   guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  Normal        guifg=#E3E3E3  ctermfg=254   guibg=#1C1C1C  ctermbg=234   gui=NONE       cterm=NONE
hi  LineNr        guifg=#465457  ctermfg=239   guibg=#262626  ctermbg=235   gui=NONE       cterm=NONE
hi  Number        guifg=#AE81FF  ctermfg=141   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  PreProc       guifg=#209400  ctermfg=28    guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  Special       guifg=#8F8F8F  ctermfg=245   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  SpellBad      guisp=#FF0000  ctermfg=225   guibg=NONE     ctermbg=NONE  gui=UNDERCURL  cterm=UNDERCURL
hi  SpellCap      guisp=#0000FF  ctermfg=21    guibg=NONE     ctermbg=NONE  gui=UNDERCURL  cterm=UNDERCURL
hi  SpellLocal    guisp=#00FFFF  ctermfg=87    guibg=NONE     ctermbg=NONE  gui=UNDERCURL  cterm=UNDERCURL
hi  SpellRare     guisp=#FF00FF  ctermfg=201   guibg=NONE     ctermbg=NONE  gui=UNDERCURL  cterm=UNDERCURL
hi  Statement     guifg=#D60C60  ctermfg=161   guibg=NONE     ctermbg=NONE  gui=BOLD       cterm=BOLD
hi  String        guifg=#D7D700  ctermfg=184   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Todo          guifg=#8F8F8F  ctermfg=245   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Type          guifg=#8EA8C2  ctermfg=109   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  CursorLineNr  guifg=#465457  ctermfg=239   guibg=#303030  ctermbg=236   gui=BOLD       cterm=BOLD
hi  Folded        guifg=#465457  ctermfg=239   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  FoldColumn    guifg=#465457  ctermfg=239   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  MatchParen    guifg=#2F8EE0  ctermfg=32    guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Error         guifg=#D70000  ctermfg=160   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Float         guifg=#AE81FF  ctermfg=141   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Operator      guifg=#AE81FF  ctermfg=141   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Exception     guifg=#2F8EE0  ctermfg=32    guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Keyword       guifg=#D60C60  ctermfg=161   guibg=NONE     ctermbg=NONE  gui=NONE       cterm=NONE
hi  Visual        guifg=NONE     ctermfg=NONE  guibg=#5F87FF  ctermbg=237   gui=NONE       cterm=NONE
