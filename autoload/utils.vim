function! utils#strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! utils#get_lines(ls, le)
    let result = []
    for l in range(a:ls, a:le)
        call add(result, getline(l))
    endfor
    return result
endfunction
