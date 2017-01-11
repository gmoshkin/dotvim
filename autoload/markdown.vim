function! markdown#remove_heading(line) abort
    execute a:line.'s/^#\+\s\+//e'
endfunction

function! markdown#put_heading(line, level) abort
    execute a:line.'s/^/'.repeat('#', a:level)." "
endfunction

function! markdown#change_to_heading() abort
    let level = nr2char(getchar())
    call markdown#remove_heading(line('.'))
    if level
        call markdown#put_heading(line('.'), level)
    endif
endfunction
