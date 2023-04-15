function! Run_jai_goto_def(...) abort
    let l:verbose = v:false
    if a:0 > 0 && a:1
        let l:verbose = v:true
    endif

    let l:file = expand('%')
    let l:line = line('.')
    let l:col = col('.')
    let l:cmd = printf('jai goto_def %s %d %d --- import_dir /home/gmoshkin/dotfiles/jai meta goto-definition', l:file, l:line, l:col)
    let l:out = system(l:cmd)
    if l:verbose
        echo l:out
    endif

    let l:sep = split(l:out, ':VIM_CMD_START:')
    if len(l:sep) == 1
        echo "definition not found"
        return
    endif
    let l:sep = split(l:sep[1], ':VIM_CMD_END:')
    if len(l:sep) == 1
        echo "definition not found"
        return
    endif
    let l:vim_cmd = l:sep[0]
    execute(l:vim_cmd)
endfunction

