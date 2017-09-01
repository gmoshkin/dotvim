function! subword#subword_move(motion) abort
    let l:old_iskeyword = &iskeyword
    set iskeyword-=_
    set iskeyword-=#
    exec "normal ".a:motion
    let &iskeyword = l:old_iskeyword
endfunction
