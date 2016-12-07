function! s:add_rep_to_path()
    let filePath = expand("%:p")
    let subDir = matchstr(filePath, ".*REP/sources/[^/]*/")
    if &path !~# subDir
        let newEntry = ','.subDir.'**,'
        let &path = &path . newEntry
    endif
endfunction

augroup REPPath
    autocmd!
    autocmd BufNew,BufRead */REP/sources/* call <SID>add_rep_to_path()
augroup END
