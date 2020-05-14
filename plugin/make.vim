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

function! s:n_jobs() abort
    return +system('nproc')
endfunction

command! -nargs=* TestDiff          call s:parse_args_and_run("-cd", "build", "make", "-j" .. s:n_jobs(), "ed-diff-ut", "&&", "./bin/ed-diff-ut")
command! -nargs=* BuildUTDiff       call s:parse_args_and_run("-cd", "build", "make", "-j" .. s:n_jobs(), "ed-diff-ut")
command! -nargs=* BuildFatty        call s:parse_args_and_run("-cd", "build", "make", "-j" .. s:n_jobs(), "fatty")
command! -nargs=* BuildDiffTool     call s:parse_args_and_run("-cd", "build", "make", "-j" .. s:n_jobs(), "ed-diff-tool")
command! -nargs=* BuildAll          call s:parse_args_and_run("-cd", "build", "make", "-j" .. s:n_jobs())
command! -nargs=* TestRelDiff       call s:parse_args_and_run("-cd", "build-rel", "make", "-j" .. s:n_jobs(), "ed-diff-ut", "&&", "./bin/ed-diff-ut")
command! -nargs=* BuildRelUTDiff    call s:parse_args_and_run("-cd", "build-rel", "make", "-j" .. s:n_jobs(), "ed-diff-ut")
command! -nargs=* BuildRelFatty     call s:parse_args_and_run("-cd", "build-rel", "make", "-j" .. s:n_jobs(), "fatty")
command! -nargs=* BuildRelDiffTool  call s:parse_args_and_run("-cd", "build-rel", "make", "-j" .. s:n_jobs(), "ed-diff-tool")
command! -nargs=* BuildRelAll       call s:parse_args_and_run("-cd", "build-rel", "make", "-j" .. s:n_jobs())
command! -nargs=* TestDRelDiff      call s:parse_args_and_run("-cd", "build-rel-deb", "make", "-j" .. s:n_jobs(), "ed-diff-ut", "&&", "./bin/ed-diff-ut")
command! -nargs=* BuildDRelUTDiff   call s:parse_args_and_run("-cd", "build-rel-deb", "make", "-j" .. s:n_jobs(), "ed-diff-ut")
command! -nargs=* BuildDRelFatty    call s:parse_args_and_run("-cd", "build-rel-deb", "make", "-j" .. s:n_jobs(), "fatty")
command! -nargs=* BuildDRelDiffTool call s:parse_args_and_run("-cd", "build-rel-deb", "make", "-j" .. s:n_jobs(), "ed-diff-tool")
command! -nargs=* BuildDRelAll      call s:parse_args_and_run("-cd", "build-rel-deb", "make", "-j" .. s:n_jobs())
command! -nargs=* Tidy              call s:parse_args_and_run("clang-tidy", "-p" , "build", expand('%:p'))
