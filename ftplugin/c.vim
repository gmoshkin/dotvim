noremap <buffer> <leader>mm <ESC>:make!<CR>:clist<CR>
noremap <buffer> <leader>mi <ESC>:make! install<CR>
noremap <buffer> <leader>mc <ESC>:make! clean<CR>
noremap <buffer> <leader>md <ESC>:make! depend<CR>
noremap <buffer> <leader>M <ESC>:make!<CR>:make! install<CR>

setlocal indentexpr=cindent#cindent(line('.'))
