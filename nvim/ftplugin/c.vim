setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal smarttab

let g:LanguageClient_serverCommands = {
\ 'cpp': ['~/repos/cquery/build/release/bin/cquery', '--language-server', '--log-file=/tmp/cq.log']                                                                                                                                                                              
\ }
let g:LanguageClient_autoStart = 1

setlocal omnifunc=LanguageClient#complete
setlocal completefunc=LanguageClient#complete
