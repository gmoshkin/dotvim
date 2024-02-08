function! Run_jai_goto_def(mode, ...) abort
    let l:verbose = v:false
    if a:0 > 0 && a:1
        let l:verbose = v:true
    endif

    let l:file = expand('%')
    let l:line = line('.')
    let l:col = col('.')
    let l:cmd = printf('jai %s %s %d %d --- import_dir /home/gmoshkin/dotfiles/jai meta goto-definition',
        \ a:mode, l:file, l:line, l:col)
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

command! JaiFiles Files ~/code/jai
noremap <leader>fj :<c-u>JaiFiles<cr>
nnoremap <leader>jd :<c-u>JaiGrepDecl <c-r><c-w><cr>

" TODO: escape stuff which breaks grep, e.g. #
command! -nargs=1 JaiGrepDecl call execute("grep '\\b" .. <q-args> .. '\b\s*::' .. "' " .. misc#git_dir() .. " ~/code/jai")
