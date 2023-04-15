setlocal commentstring=//%s

noremap <buffer> <leader>gd :<c-u>call Run_jai_goto_def('goto_def')<cr>
" this doens't work because vim/nvim(?) is garbage
" noremap <buffer> <leader>gg :<c-u>grep '\b<c-w>\s*::'<cr>
