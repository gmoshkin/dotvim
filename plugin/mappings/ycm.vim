nnoremap <F9> :<C-U>YcmCompleter GetType<CR>
nnoremap <leader>yt :<C-U>YcmCompleter GetType<CR>
nnoremap <leader>gt :<C-U>call append('.', split(execute('YcmCompleter GetType'),'\n')[0].' a;') <bar> normal! j<CR>
nnoremap <leader>gd :<C-U>YcmCompleter GoToDefinition<CR>
nnoremap <leader>yd :<C-U>YcmCompleter GoToDefinition<CR>
nnoremap <leader>gD :<C-U>YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yD :<C-U>YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yg :<C-U>YcmCompleter GoTo<CR>
nnoremap <leader>yI :<C-U>YcmCompleter GoToImprecise<CR>
nnoremap <leader>yi :<C-U>YcmCompleter GoToInclude<CR>
nnoremap <leader>yr :<C-U>YcmCompleter GoToReferences<CR>
xnoremap <leader>yf :YcmCompleter FixIt<CR>
