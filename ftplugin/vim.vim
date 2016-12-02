function! ExecLines(ls, le) abort
    let lines = GetLines(a:ls, a:le)
    call filter(lines, 'v:val !~ "^\s*\""')
    let command = join(lines, "\n")
    exec command
endfunction

function! ExecuteOperatorFunc(type)
    call ExecLines(line("'["), line("']"))
endfunction

command! -range ExecFunction call ExecLines(<line1>, <line2>)

vnoremap <silent> <leader>e :ExecFunction<CR>
noremap <silent> <leader>ee :<C-U>set operatorfunc=ExecuteOperatorFunc<BAR>:call feedkeys(v:count1.'g@_')<CR>
noremap <silent> <leader>e :<C-U>set operatorfunc=ExecuteOperatorFunc<CR>g@

noremap K <ESC>:help <C-R><C-W><CR>
vnoremap K "hy:help <C-R>h<CR>

setlocal foldmethod=marker
let b:foldmethod_set = 1
