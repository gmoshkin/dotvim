function! term#get(...) abort
    if a:0 > 0 && !empty(a:1)
        if type(a:1) == v:t_list
            return a:1[0]
        else
            return a:1
        endif
    elseif &bt == 'terminal'
        return bufnr('%')
    elseif len(term_list()) > 0
        return term_list()[0]
    else
        return v:none
    endif
endfunction

function! term#sendkeys(keys) abort
    let l:term = term#get()
    if empty(l:term)
        return v:none
    endif
    return term_sendkeys(l:term, a:keys)
endfunction

function! term#job(...) abort
    let l:term = term#get(a:000)
    if empty(l:term)
        return v:none
    endif
    return term_getjob(l:term)
endfunction

function! term#job_info(...) abort
    let l:job = term#job(a:000)
    if empty(l:job)
        return v:none
    endif
    return job_info(l:job)
endfunction
