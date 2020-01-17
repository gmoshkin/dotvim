nnoremap <F9> :<C-U>YcmCompleter GetType<CR>
nnoremap <leader>gt :<C-U>call append('.', split(execute('YcmCompleter GetType'),'\n')[0].' a;') <bar> normal! j<CR>
nnoremap <leader>gd :<C-U>YcmCompleter GoToDefinition<CR>
