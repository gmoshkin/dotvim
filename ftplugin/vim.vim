function! s:execop(type)
    call execlines#execlines(line("'["), line("']"))
endfunction

command! -range ExecLines call execlines#execlines(<line1>, <line2>)

vnoremap <buffer> <silent> <leader>e :ExecLines<CR>
nnoremap <buffer> <silent> <leader>ee :<C-U>set operatorfunc=<SID>execop<BAR>:call feedkeys(v:count1.'g@_')<CR>
nnoremap <buffer> <silent> <leader>e :<C-U>set operatorfunc=<SID>execop<CR>g@

noremap <buffer> K <ESC>:help <C-R><C-W><CR>
vnoremap <buffer> K "hy:help <C-R>h<CR>

setlocal foldmethod=marker
let b:foldmethod_set = 1
