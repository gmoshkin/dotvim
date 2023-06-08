function! is_wsl#is_wsl() abort
    if !file_readable('/proc/version')
        return 0
    endif

    return readfile('/proc/version')[0] =~? 'wsl'
endfunction
