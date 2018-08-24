function! toggle#auto_format(...) abort
    if a:0 > 0
        if a:1
            let b:auto_format_enabled = 1
        else
            let b:auto_format_enabled = 0
        endif
    else
        if !exists('b:auto_format_enabled')
            let b:auto_format_enabled = 1
        else
            let b:auto_format_enabled = !b:auto_format_enabled
        endif
    endif
    if b:auto_format_enabled
        " setlocal formatoptions+=a
        setlocal formatoptions+=t
        let message = 'autoformat enabled'
    else
        setlocal formatoptions-=a
        setlocal formatoptions-=t
        let message = 'autoformat disabled'
    endif
    if a:0 < 2 || a:2 != 0
        echo message
    endif
endfunction

function! toggle#color_column()
    if !exists('b:colorcolumn_enabled')
        let b:colorcolumn_enabled = 1
    endif
    if b:colorcolumn_enabled
        setlocal colorcolumn=
        echo 'colorcolumn disabled'
    else
        setlocal colorcolumn=+1
        echo 'colorcolumn enabled'
    endif
    let b:colorcolumn_enabled = !b:colorcolumn_enabled
endfunction

function! toggle#tabstop() abort
    if !exists('b:last_tabstop')
        if &tabstop == 8
            let b:last_tabstop = 4
        else
            let b:last_tabstop = 8
        endif
    endif
    let [&tabstop, b:last_tabstop] = [b:last_tabstop, &tabstop]
endfunction
