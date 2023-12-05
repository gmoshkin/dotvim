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

function! Hex(v) abort
    if type(a:v) == v:t_number
        return printf("0x%02x", a:v)
    elseif type(a:v) == v:t_string
        let l:res = '"'
        for l:i in range(len(a:v))
            let l:res = printf('%s\x%02x', l:res, char2nr(a:v[l:i]))
        endfor
        let l:res = l:res .. '"'
        return l:res
    elseif type(a:v) == v:t_list
        let l:elems = []
        for l:e in a:v
            call add(l:elems, Hex(l:e))
        endfor
        return printf('[%s]', join(l:elems, ', '))
    endif
endfunction
