function! s:tabularize_char()
    let c = getchar()
    execute 'Tabularize/'.nr2char(c)
endfunction

noremap <Leader>t <Esc>:call <SID>tabularize_char()<CR>
noremap <Leader>T <Esc>:Tabularize<CR>
