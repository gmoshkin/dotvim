command! -bang -nargs=1 SearchInBlock call blocksearch#search(<q-args>, "<bang>")
nnoremap <leader>gn :<C-U>SearchInBlock <cword><CR>
nnoremap <leader>gN :<C-U>SearchInBlock! <cword><CR>
