function! Type(obj) abort
    return a:obj->type()->Type2Str()
endfunction

function! Type2Str(type) abort
    return {
        \ v:t_bool    : 'bool',
        \ v:t_channel : 'channel',
        \ v:t_dict    : 'dict',
        \ v:t_float   : 'float',
        \ v:t_func    : 'func',
        \ v:t_job     : 'job',
        \ v:t_list    : 'list',
        \ v:t_none    : 'none',
        \ v:t_number  : 'number',
        \ v:t_string  : 'string',
        \ v:t_blob    : 'blob',
    \ }->get(a:type, 'excuse me?')
endfunction

function! Debug(obj) abort
    let l:obj_str = a:obj->type() == v:t_string ? printf("'%s'", a:obj) : a:obj
    return printf("%s(%s)", a:obj->Type(), l:obj_str)
endfunction
