setlocal commentstring=//%s

if !executable("jails")
    noremap <buffer> <leader>gd :<c-u>call Run_jai_goto_def('goto_def')<cr>
endif
" this doens't work because vim/nvim(?) is garbage
" noremap <buffer> <leader>gg :<c-u>grep '\b<c-w>\s*::'<cr>
