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

function! s:build_target_in_dir(dir, target) abort
    call s:parse_args_and_run("-cd", a:dir, "make", "-j" .. s:n_jobs(), a:target)
endfunction

function! s:build_target_in_dir_and_run(dir, target, cmd) abort
    call s:parse_args_and_run("-cd", a:dir, "make", "-j" .. s:n_jobs(), a:target, "&&", a:cmd)
endfunction

command! -nargs=* TestDiff          call s:build_target_in_dir_and_run("build", "ed-diff-ut", "./bin/ed-diff-ut")
command! -nargs=* BuildUTDiff       call s:build_target_in_dir("build", "ed-diff-ut")
command! -nargs=* BuildFatty        call s:build_target_in_dir("build", "fatty")
command! -nargs=* BuildDiffTool     call s:build_target_in_dir("build", "ed-diff-tool")
command! -nargs=* BuildAll          call s:build_target_in_dir("build", "all")
command! -nargs=* TestRelDiff       call s:build_target_in_dir_and_run("build-rel", "ed-diff-ut", "./bin/ed-diff-ut")
command! -nargs=* BuildRelUTDiff    call s:build_target_in_dir("build-rel", "ed-diff-ut")
command! -nargs=* BuildRelFatty     call s:build_target_in_dir("build-rel", "fatty")
command! -nargs=* BuildRelDiffTool  call s:build_target_in_dir("build-rel", "ed-diff-tool")
command! -nargs=* BuildRelAll       call s:build_target_in_dir("build-rel", "all")
command! -nargs=* TestDRelDiff      call s:build_target_in_dir_and_run("build-rel-deb", "ed-diff-ut", "./bin/ed-diff-ut")
command! -nargs=* BuildDRelUTDiff   call s:build_target_in_dir("build-rel-deb", "ed-diff-ut")
command! -nargs=* BuildDRelFatty    call s:build_target_in_dir("build-rel-deb", "fatty")
command! -nargs=* BuildDRelDiffTool call s:build_target_in_dir("build-rel-deb", "ed-diff-tool")
command! -nargs=* BuildDRelAll      call s:build_target_in_dir("build-rel-deb", "all")
command! -nargs=* Tidy              call s:parse_args_and_run("clang-tidy", "-p" , "build", expand('%:p'))
