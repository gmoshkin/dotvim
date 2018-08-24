function! svres#go(line) abort
    let l:curline = a:line
    let l:file = matchstr(l:curline, 'file="\zs[^"]\+\ze"')
    let l:line = matchstr(l:curline, 'line="\zs[^"]\+\ze"')
    execute 'e '.l:file
    execute l:line
endfunction
