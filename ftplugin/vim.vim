vnoremap <Leader>e :ExecFunction<CR>
noremap <Leader>ee <ESC>:execute getline('.')<CR>

setlocal foldmethod=marker
let b:foldmethod_set = 1
