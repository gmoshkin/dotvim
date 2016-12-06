function! gshift#shift_line(linenr, spaces)
    let line = getline(a:linenr)
    let tmp = split(line, '\v^\s*\zs')
    if len(tmp) < 2
        if a:spaces > 0 && len(line) > 0
            call setline(a:linenr, repeat(' ', a:spaces) . line)
        endif
    else
        if a:spaces > 0
            call setline(a:linenr, join(tmp, repeat(' ', a:spaces)))
        else
            let indent = substitute(tmp[0], '\v {-,' . -a:spaces . '}$', '', '')
            call setline(a:linenr, indent . tmp[1])
        endif
    endif
endfunction

function! gshift#shift_lines(ls, le, spaces)
    for l in range(a:ls, a:le)
        call gshift#shift_line(l, a:spaces)
    endfor
endfunction
