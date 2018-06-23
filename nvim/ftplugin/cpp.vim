let g:LanguageClient_serverCommands = {
\ 'cpp': ['~/repos/cquery/build/release/bin/cquery', '--language-server', '--log-file=/tmp/cq.log']                                                                                                                                                                              
\ }
let g:LanguageClient_autoStart = 1

set omnifunc=LanguageClient#complete
set completefunc=LanguageClient#complete
