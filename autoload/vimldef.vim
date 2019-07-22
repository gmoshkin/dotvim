function! vimldef#cmd2qf(cmd) abort
    let l:cmd = empty(a:cmd) ? expand('<cword>') : a:cmd
    if empty(l:cmd)
        return
    endif
    let l:info = execute('verbose command '.l:cmd)
    if l:info =~ 'No user-defined'
        echoerr split(l:info, '\n')[0]
    else
        call vimldef#set_qf(l:info)
        cfirst
    endif
endfunction

function! vimldef#func2qf(func) abort
    let l:func = empty(a:func) ? expand('<cword>') : a:func
    let l:func = substitute(l:func, '(.*', '', '')
    if empty(l:func)
        return
    endif
    try
        call vimldef#set_qf(execute('verbose function '.l:func))
    catch /Undefined/
        call vimldef#try_find_autoload(l:func)
    endtry
    cfirst
endfunction

function! vimldef#set_qf(info) abort
    let l:qf_list = []
    for l:l in split(a:info, '\n')
        let l:m = matchlist(l:l, '^\s*Last set from \(\f*\) line \(\d\+\)')
        if !empty(l:m)
            call add(l:qf_list, {
                \'filename': expand(l:m[1]),
                \'lnum': l:m[2],
                \'text': substitute(l:prev, '\s\+', ' ', 'g'),
            \})
        endif
        let l:prev = l:l
    endfor
    call setqflist(l:qf_list)
endfunction

function! vimldef#try_goto_def(name) abort
    try
        normal! 
        return
    catch /tag not found\|No tags file/
    endtry
    try
        return vimldef#cmd2qf(a:name)
    catch //
    endtry
    try
        return vimldef#func2qf(a:name)
    catch /ATTENTION/
        return
    catch //
    endtry
    echoerr printf("no '%s' function or command found", a:name)
endfunction

function! vimldef#try_find_autoload(name) abort
    if a:name !~ '#'
        throw 'Undefined function '.a:name
    endif
    let l:parts = split(a:name, '#')
    let l:filename = 'autoload/'.join(l:parts[:-2], '/').'.vim'
    let l:found = findfile(l:filename, &runtimepath, -1)
    if empty(l:found)
        throw 'Undefined function '.a:name
    endif
    let l:qf_list = []
    for l:f in l:found
        call add(l:qf_list, {
            \'filename': l:f,
            \'pattern': 'func.*'.a:name,
            \'text': a:name,
        \})
    endfor
    call setqflist(l:qf_list)
endfunction
