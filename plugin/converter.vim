command! ConvertWord call converter#convert_iword()

function! s:repeatable() abort
    call converter#convert_iword()
    silent! call repeat#set("\<Plug>ConvertWord", v:count)
endfunction

nnoremap <silent> <Plug>ConvertWord :<c-u>call <SID>repeatable()<cr>
nmap crx <Plug>ConvertWord
