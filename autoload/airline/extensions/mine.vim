" MIT License. Copyright (c) 2013-2019 Bailey Ling et al.

scriptencoding utf-8

function! airline#extensions#mine#apply(...)
    if &buftype == 'terminal' || bufname('%')[0] == '!'
        let name=get(g:airline_mode_map, 't', 't')
        call a:1.add_section('airline_a', ' '.name.' ')
        call a:1.add_section('airline_b', '')
        call a:1.add_section('airline_term', ' '.s:termname())
        call a:1.split()
        let l:tty = s:tty()
        call a:1.add_section('airline_x', s:tty().' ')
        call a:1.add_section('airline_y', '%{airline#extensions#mine#pid_or_dead()}')
        call a:1.add_section('airline_z', ' '.'%#__accent_bold#%l/%L :%3v'.' ')
        return 1
    endif
endfunction

function! s:job_info()
    try
        return job_info(term_getjob(bufnr('%')))
    catch //
        return 0
    endtry
endfunction

function! s:tty()
    let l:job_info = s:job_info()
    if empty(l:job_info)
        return ''
    endif
    return l:job_info.tty_out
endfunction

function! airline#extensions#mine#pid_or_dead()
    let l:job_info = s:job_info()
    if empty(l:job_info)
        return ''
    endif
    if l:job_info.status ==# 'run'
        return ' '.l:job_info.process.' '
    else
        return ' '.l:job_info.status.' '
    endif
endfunction

function! airline#extensions#mine#inactive_apply(c, w)
    if getbufvar(a:w.bufnr, '&buftype') == 'terminal'
        let spc = g:airline_symbols.space
        call a:c.add_section('airline_a', spc.'TERMINAL'.spc)
        call a:c.add_section('airline_b', spc.'%f')
        return 1
    endif
endfunction

function! s:termname()
    let bufname = bufname('%')
    if has('nvim')
        return matchstr(bufname, 'term.*:\zs.*')
    else
        " get rid of leading '!'
        if bufname[0] is# '!'
            return bufname[1:]
        else
            return bufname
        endif
    endif
endfunction

function! airline#extensions#mine#init(ext)
    for f in ['airline#extensions#term#apply', 'airline#extensions#term#inactive_apply']
        let l:i = index(g:airline_statusline_funcrefs, function(f))
        if l:i >= 0
            call remove(g:airline_statusline_funcrefs, l:i)
        endif
    endfor
    call a:ext.add_statusline_func('airline#extensions#mine#apply')
    call a:ext.add_inactive_statusline_func('airline#extensions#mine#inactive_apply')
endfunction
