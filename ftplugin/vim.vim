function! ExecLines(ls, le) abort
    let lines = []
    for l in range(a:ls, a:le)
        call add(lines, getline(l))
    endfor
    let command = join(lines, "\n")
    exec command
endfunction

function! ExecuteOperator(type)
    call ExecLines(line("'["), line("']"))
endfunction

command! -range ExecFunction call ExecLines(<line1>, <line2>)

vnoremap <leader>e :ExecFunction<CR>
noremap <leader>ee <ESC>:execute getline('.')<CR>
noremap <silent> <leader>e :set operatorfunc=ExecuteOperator<CR>g@

noremap K <ESC>:help <C-R><C-W><CR>
vnoremap K "hy:help <C-R>h<CR>

setlocal foldmethod=marker
let b:foldmethod_set = 1
