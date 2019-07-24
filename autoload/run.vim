function! s:cmd(file, hashbang) abort
    if a:hashbang !~ '^#!'
        throw 'Cannot determine command to run'
    endif
    return a:hashbang[2:].' '.a:file
endfunction

function! run#run_file() abort
    let l:cmd = s:cmd(expand('%'), getline(1))
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
    let l:term = term_start(l:cmd, {'curwin': v:true})
    wincmd p
    let b:term = l:term
endfunction
