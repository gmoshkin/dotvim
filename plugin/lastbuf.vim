function! s:open_last_file() abort
    if !empty(expand('#'))
        execute "normal! \<c-^>"
    else
        execute "edit ".ctrlp#mrufiles#list()[1]
    endif
endfunction

nnoremap <silent> <c-^> :<c-u>call <SID>open_last_file()<cr>
