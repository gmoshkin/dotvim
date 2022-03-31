function! Type(obj) abort
    return a:obj->type()->Type2Str()
endfunction

function! Type2Str(type) abort
    let l:type_dict = {
        \ v:t_bool    : 'bool',
        \ v:t_dict    : 'dict',
        \ v:t_float   : 'float',
        \ v:t_func    : 'func',
        \ v:t_list    : 'list',
        \ v:t_number  : 'number',
        \ v:t_string  : 'string',
        \ v:t_blob    : 'blob',
    \ }
    for l:t in ['channel', 'job', 'none']
        let l:v = get(v:, 't_' .. l:t)
        if l:v
            let l:type_dict[l:v] = l:t
        endif
    endfor
    return l:type_dict->get(a:type, 'excuse me?')
endfunction

function! Debug(obj) abort
    if type(a:obj) == v:t_list
        let l:repr = a:obj->map({_, v -> Debug(v)})->join(', ')
        return printf("%s[%s]", Type(a:obj), l:repr)
    elseif type(a:obj) == v:t_dict
        let l:repr = a:obj->map({k, v -> printf("'%s': %s", k, Debug(v))})
            \ ->values()->join(', ')
        return printf("%s{%s}", Type(a:obj), l:repr)
    elseif type(a:obj) == v:t_string
        return printf("%s('%s')", Type(a:obj), a:obj)
    else
        return printf("%s(%s)", Type(a:obj), a:obj)
    endif
endfunction
