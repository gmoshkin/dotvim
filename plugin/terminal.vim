augroup Terminal
    autocmd!
    autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | endif
augroup END

highlight StatusLineTerm term=bold,reverse cterm=bold ctermfg=0 ctermbg=14
highlight StatusLineTermNC term=bold,reverse cterm=bold ctermfg=0 ctermbg=14
