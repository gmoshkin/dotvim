function! s:cmd(file, hashbang) abort
    if a:hashbang !~ '^#!'
        throw 'Cannot determine command to run'
    endif
    return a:hashbang[2:].' '.a:file
endfunction

function! s:gotobuf(bufnr, ...) abort
    if bufnr(a:bufnr) < 0
        return
    endif
    let l:win = bufwinnr(a:bufnr)
    if l:win == bufwinnr(bufnr('%'))
        return
    elseif l:win > 0
        exe l:win.'wincmd w'
    else
        if a:0
            exe a:1.' sbuffer '.a:bufnr
        else
            sbuffer a:bufnr
        endif
    endif
endfunction

function! run#run_file(...) abort
    let l:origin = bufnr('%')
    if exists('b:creator')
        call s:gotobuf(b:creator, 'above')
    endif
    if a:0 && !empty(a:1)
        let l:cmd = a:1.' '.expand('%')
    else
        let l:cmd = s:cmd(expand('%'), getline(1))
    endif
    let l:creator = bufnr('%')
    if exists('b:term') && !empty(term_getstatus(b:term))
        let l:job = term_getjob(b:term)
        if !empty(job_info(l:job)) && job_info(l:job).status !=# 'run'
            call job_stop(l:job)
        endif
        call s:gotobuf(b:term, 'below')
    else
        below new
    endif
    let l:term = term_start(l:cmd, {'curwin': v:true})
    call setbufvar(l:term, 'creator', l:creator)
    call s:gotobuf(l:origin)
    let b:term = l:term
endfunction
