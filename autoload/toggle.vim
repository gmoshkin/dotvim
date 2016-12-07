function! toggle#auto_format()
    if !exists('b:auto_format_enabled')
        let b:auto_format_enabled = 0
    endif
    if b:auto_format_enabled
        setlocal formatoptions-=a
        setlocal formatoptions-=t
        echo 'autoformat disabled'
    else
        setlocal formatoptions+=a
        setlocal formatoptions+=t
        echo 'autoformat enabled'
    endif
    let b:auto_format_enabled = !b:auto_format_enabled
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
