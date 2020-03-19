function! s:parse_args_and_run(...) abort
    if a:000->len() == 0
        if !exists('g:make_build_last_args') || g:make_build_last_args->len() != 2
            echoerr 'Not enough arguments'
            return
        else
            let [l:cmd, l:cwd] = g:make_build_last_args
        endif
    elseif a:000[0] == '-cd'
        if a:000->len() < 2
            echoerr '-cd requires an argument'
            return
        endif
        let l:cwd = a:000[1]
        let l:cmd = a:000[2:]->join(' ')
    else
        let l:cwd = '.'
        let l:cmd = a:000->join(' ')
    endif
    let g:make_build_last_args = [l:cmd, l:cwd]
    call make_old#run_make(l:cmd, l:cwd)
endfunction
command! -nargs=* Build call s:parse_args_and_run(<f-args>)

command! -nargs=* TestDiff      call s:parse_args_and_run("-cd", "build", "make", "-j" .. utils#ceil(system('nproc') * 0.6), "ut-ed-diff", "&&", "./bin/ut-ed-diff")
command! -nargs=* BuildFatty    call s:parse_args_and_run("-cd", "build", "make", "-j" .. utils#ceil(system('nproc') * 0.6), "fatty")
command! -nargs=* BuildDiffTool call s:parse_args_and_run("-cd", "build", "make", "-j" .. utils#ceil(system('nproc') * 0.6), "ed-diff-tool")
