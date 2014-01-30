" NightSprings - a Vim color scheme
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
let g:colors_name="night_springs"

hi  Boolean             ctermfg=013   ctermbg=NONE  cterm=BOLD
hi  Character           ctermfg=003   ctermbg=NONE  cterm=NONE
hi  Comment             ctermfg=010   ctermbg=NONE  cterm=NONE
hi  Conditional         ctermfg=014   ctermbg=NONE  cterm=BOLD
hi  Constant            ctermfg=013   ctermbg=NONE  cterm=BOLD
hi  Cursor              ctermfg=015   ctermbg=015   cterm=NONE
hi  Define              ctermfg=012   ctermbg=NONE  cterm=BOLD
hi  Directory           ctermfg=004   ctermbg=NONE  cterm=BOLD
hi  Delimeter           ctermfg=008   ctermbg=NONE  cterm=NONE
hi  Function            ctermfg=006   ctermbg=NONE  cterm=NONE
hi  Identifier          ctermfg=009   ctermbg=NONE  cterm=NONE
hi  DiffAdd             ctermfg=002   ctermbg=000   cterm=NONE
hi  DiffChange          ctermfg=003   ctermbg=000   cterm=NONE
hi  DiffDelete          ctermfg=001   ctermbg=000   cterm=NONE
hi  DiffText            ctermfg=003   ctermbg=000   cterm=NONE
hi  SignColumn          ctermfg=011   ctermbg=000   cterm=NONE
hi  Normal              ctermfg=004   ctermbg=000   cterm=NONE
hi  LineNr              ctermfg=010   ctermbg=008   cterm=NONE
hi  Number              ctermfg=013   ctermbg=NONE  cterm=NONE
hi  PreProc             ctermfg=015   ctermbg=NONE  cterm=BOLD
hi  Special             ctermfg=010   ctermbg=NONE  cterm=NONE
hi  SpellBad            ctermfg=007   ctermbg=NONE  cterm=UNDERCURL
hi  SpellCap            ctermfg=007   ctermbg=NONE  cterm=UNDERCURL
hi  SpellLocal          ctermfg=007   ctermbg=NONE  cterm=UNDERCURL
hi  SpellRare           ctermfg=007   ctermbg=NONE  cterm=UNDERCURL
hi  Statement           ctermfg=014   ctermbg=NONE  cterm=BOLD
hi  String              ctermfg=003   ctermbg=NONE  cterm=NONE
hi  Todo                ctermfg=012   ctermbg=NONE  cterm=NONE
hi  Type                ctermfg=012   ctermbg=NONE  cterm=NONE
hi  CursorLineNr        ctermfg=010   ctermbg=000   cterm=BOLD
hi  Folded              ctermfg=004   ctermbg=NONE  cterm=NONE
hi  FoldColumn          ctermfg=004   ctermbg=NONE  cterm=NONE
hi  MatchParen          ctermfg=009   ctermbg=NONE  cterm=NONE
hi  Error               ctermfg=001   ctermbg=NONE  cterm=NONE
hi  Float               ctermfg=013   ctermbg=NONE  cterm=NONE
hi  Operator            ctermfg=002   ctermbg=NONE  cterm=NONE
hi  Exception           ctermfg=002   ctermbg=NONE  cterm=NONE
hi  Keyword             ctermfg=014   ctermbg=NONE  cterm=NONE
hi  Visual              ctermfg=NONE  ctermbg=008   cterm=NONE
hi  PmenuSel            ctermfg=NONE  ctermbg=008   cterm=NONE
hi  IncSearch           ctermfg=000   ctermbg=010   cterm=NONE
hi  PreCondit           ctermfg=014   ctermbg=NONE  cterm=BOLD
hi  Macro               ctermfg=012   ctermbg=NONE  cterm=BOLD
hi  Structure           ctermfg=009   ctermbg=NONE  cterm=NONE
hi  StorageClass        ctermfg=013   ctermbg=NONE  cterm=NONE
hi  Label               ctermfg=014   ctermbg=NONE  cterm=BOLD
hi  TrailingWhitespace  ctermfg=NONE  ctermbg=001   cterm=BOLD
