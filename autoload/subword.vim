function! subword#subword_move(motion, mode) abort
    let l:old_iskeyword = &iskeyword
    set iskeyword-=_
    set iskeyword-=#
    set iskeyword-=-
    exec "normal " .. (a:mode ==? 'v' ? 'gv' : '') .. a:motion
    let &iskeyword = l:old_iskeyword
endfunction
