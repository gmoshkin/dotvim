vnoremap <Leader>e :ExecFunction<CR>
noremap <Leader>ee <ESC>:execute getline('.')<CR>

noremap K <ESC>:help <C-R><C-W><CR>
vnoremap K "hy:help <C-R>h<CR>

setlocal foldmethod=marker
let b:foldmethod_set = 1
