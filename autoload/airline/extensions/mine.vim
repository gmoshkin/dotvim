" MIT License. Copyright (c) 2013-2019 Bailey Ling et al.

scriptencoding utf-8

function! airline#extensions#mine#apply(...)
    if &buftype == 'terminal' || bufname('%')[0] == '!'
        let l:s = g:airline_symbols.space

        let name=get(g:airline_mode_map, 't', 't')
        call a:1.add_section('airline_a', l:s.name.l:s)
        call a:1.add_section('airline_b', '')
        call a:1.add_section('airline_term', l:s.s:termname())
        call a:1.split()
        call a:1.add_section('airline_x', s:job_info().tty_out.l:s)
        call a:1.add_section('airline_y', l:s.'%{airline#extensions#mine#pid_or_dead()}'.l:s)
        call a:1.add_section('airline_z', l:s.'%#__accent_bold#%l/%L :%3v'.l:s)
        return 1
    endif
endfunction

function! s:job_info()
    return job_info(term_getjob(bufnr('%')))
endfunction

function! airline#extensions#mine#pid_or_dead()
    let l:job_info = job_info(term_getjob(bufnr('%')))
    if l:job_info.status ==# 'run'
        return l:job_info.process
    else
        return l:job_info.status
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
