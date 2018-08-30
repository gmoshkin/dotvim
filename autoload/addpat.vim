function! addpat#add_visual() abort
    " FIXME: should probably escape all kinds of stuff
    let l:selected = getline("'<")[col("'<") - 1:col("'>") - 1]
    let @/ = @/.'\|'.l:selected
endfunction

function! addpat#add_normal() abort
    let l:old_pat = @/
    execute 'normal *'
    let @/ = l:old_pat.'\|'.@/
endfunction

function! addpat#add(mode) abort
    " FIXME: do not add a subpattern that's already contained in the current pattern
    if ! v:hlsearch
        normal! +
        return
    endif
    if a:mode == 'v'
        call addpat#add_visual()
    else
        call addpat#add_normal()
    endif
endfunction
