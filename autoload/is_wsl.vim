function! is_wsl#is_wsl() abort
    return readfile('/proc/version')[0] =~? 'wsl'
endfunction
