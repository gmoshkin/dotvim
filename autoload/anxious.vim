function! anxious#hl_trace() abort
    let l:tainted_offsets = []
    let l:saved_pos = getcurpos()
    g/\v^; \zs[a-f0-9]+\ze:/call add(l:tainted_offsets, matchstr(getline('.'), @/))
    let @/ = join(l:tainted_offsets, '\|')
    call setpos('.', l:saved_pos)
endfunction

function! anxious#mark_trace() abort
    g//normal! A ; taint!
endfunction
