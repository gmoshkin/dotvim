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

function! s:kill(job) abort
    call job_stop(a:job)
    if job_info(a:job).status ==# 'run'
        echom 'killing job '.a:job
        call job_stop(a:job, 'kill')
    endif
endfunction

function! run#compiled(filename, ft) abort
    let l:exe = fnamemodify(a:filename, ':r')
    let l:compile = printf(g:run_compiled[a:ft], a:filename, l:exe)
    let l:run = printf('%s; echo "exit status: $?"', l:exe)
    return l:compile .. ' && ' .. l:run
endfunction

function! run#run_file(...) abort
    let l:origin = bufnr('%')
    if exists('b:creator') && !exists('b:term')
        let l:creator = b:creator
    elseif !exists('b:creator')
        let l:creator = bufnr('%')
        if exists('b:term') && !empty(term_getstatus(b:term))
            let l:job = term_getjob(b:term)
            if !empty(job_info(l:job)) && job_info(l:job).status ==# 'run'
                call s:kill(l:job)
            endif
            call s:gotobuf(b:term, 'below')
        elseif exists('b:term') && empty(term_getstatus(b:term))
            unlet b:term
            below new
        else
            below new
        endif
    else
        echoerr 'WHAT'
    endif
    let l:filename = bufname(l:creator)
    if a:0 && !empty(a:1)
        let l:cmd = a:1.' '.l:filename
    else
        " TODO: add shit for running
        " * "cargo build" if it's "rust" and there's "Cargo.toml" somewhere up
        " * "rustc" and then run the executable if no "Cargo.toml"
        " * "clang++" for c++ etc....
        let l:buf_ft = getbufvar(l:creator, '&ft')
        if index(keys(get(g:, 'run_compiled', {})), l:buf_ft) >= 0
            let l:cmd = run#compiled(l:filename, l:buf_ft)
        else
            let l:cmd = s:cmd(l:filename, getbufline(l:creator, 1)[0])
        endif
    endif
    let l:term = term_start(['sh', '-c', l:cmd], {'curwin': v:true})
    call setbufvar(l:term, 'creator', l:creator)
    call setbufvar(l:creator, 'term', l:term)
    call s:gotobuf(l:origin)
endfunction

function! run#restart(...) abort
    if &bt == 'terminal'
        let l:old_term = term#get()
        call s:kill(term#job())
        call term_start(term#job_info().cmd, {'curwin': v:true})
    endif
endfunction
