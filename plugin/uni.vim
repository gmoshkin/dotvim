command! Ascii echo uni#do_ascii()
if executable('perl6')
    nnoremap <silent> ga :<c-u>Ascii<cr>
endif
