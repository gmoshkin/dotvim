function! spot#select_pos_operator_func(type)
    let ls = line("'[")
    let cs = col("'[")
    let le = line("']")
    let ce = col("']")
    if a:type == "line"
        call spot#select_positions('', ls, 0, le, 0)
    elseif a:type == "char"
        call spot#select_positions('', ls, cs, le, ce + 1)
    elseif a:type == "block"
        " TODO: add support for block selection
        call spot#select_positions('', ls, cs, le, ce + 1)
    endif
endfunction

nnoremap <silent> gs :<C-U>set operatorfunc=spot#select_pos_operator_func<CR>g@
vnoremap <silent> gs :<C-U>call spot#select_positions('', line("'<"), col("'<"), line("'>"), col("'>") + 1)<CR>
nnoremap <silent> gss :<C-U>set operatorfunc=spot#select_pos_operator_func<BAR>:execute 'normal '.v:count1.'g@_'<CR>
nnoremap <silent> gsx :<C-U>call spot#match_pattern('')<CR>
