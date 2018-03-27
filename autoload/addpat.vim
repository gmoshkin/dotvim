function! addpat#add_cword() abort
    if ! v:hlsearch
        return
    endif
    let l:old_pat = @/
    execute 'normal *'
    let @/ = l:old_pat.'\|'.@/
endfunction
