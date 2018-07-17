augroup FugitiveLCD
    autocmd!
    autocmd BufEnter * if !exists(':Gcd') | cd | else | Gcd | endif
augroup END
