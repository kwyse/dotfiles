compiler cargo

let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly-2017-12-30', 'rls'] }
let g:LanguageClient_autoStart = 1

set omnifunc=LanguageClient#complete
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> + :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> _ :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
