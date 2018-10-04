function! smartercase#normal(cmd) abort
    call utils#save_option_do("ignorecase", "normal! ".a:cmd)
    let @/ .= '\C'
endfunction
