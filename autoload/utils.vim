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

function! utils#save_option_do(optname, cmd) abort
    execute "let saved = &".a:optname
    execute "set no".a:optname
    try
        execute a:cmd
    finally
        execute "let &".a:optname." = saved"
    endtry
endfunction

function! utils#get_vword() abort
    if line("'<") != line("'>")
        return ''
    endif
    return getline(line("'<"))[col("'<") - 1:col("'>") - 1]
endfunction

function! utils#ceil(v) abort
    let l:f = float2nr(a:v)
    return l:f + (a:v - l:f > 0)
endfunction
