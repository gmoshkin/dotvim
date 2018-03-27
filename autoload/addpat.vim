function! addpat#add_cword() abort
    " FIXME: do not add a subpattern that's already contained in the current pattern
    if ! v:hlsearch
        normal! +
        return
    endif
    let l:old_pat = @/
    execute 'normal *'
    let @/ = l:old_pat.'\|'.@/
endfunction
