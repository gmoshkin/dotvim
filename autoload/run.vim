function! s:cmd(file, hashbang) abort
    if a:hashbang !~ '^#!'
        throw 'Cannot determine command to run'
    endif
    return a:hashbang[2:].' '.a:file
endfunction

function! run#run_file(...) abort
    if a:0 && !empty(a:1)
        let l:cmd = a:1.' '.expand('%')
    else
        let l:cmd = s:cmd(expand('%'), getline(1))
    endif
    let l:job = term_getjob(b:term)
    if exists('b:term') && !empty(term_getstatus(b:term))
        let l:win = bufwinnr(b:term)
        if l:win > 0
            exe l:win.'wincmd w'
        else
            below sbuffer b:term
        endif
    else
        below new
    endif
    if job_info(l:job).status !=# 'run'
        call job_stop(l:job)
    endif
    let l:term = term_start(l:cmd, {'curwin': v:true})
    wincmd p
    let b:term = l:term
endfunction
