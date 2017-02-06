let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

augroup NERDTreeFind
    autocmd!
    autocmd User NERDTreeInit call nerdtreeautocmd#jump_to_last_file()
augroup END
