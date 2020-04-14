function! Do_x_eol() abort
    if col('.') > len(getline('.'))
        normal! Jx
    else
        normal! x
    endif
endfunction

function! Do_X_eol() abort
    if col('.') == 1 && line('.') > 1
        normal! kJx
    else
        normal! X
    endif
endfunction

if get(g:, 'x_eol_enable')
    set virtualedit+=onemore
    nnoremap x :<c-u>call Do_x_eol()<cr>
    nnoremap X :<c-u>call Do_X_eol()<cr>
endif
