function make_old#output_handler(chan, output) abort
    eval g:make_old_output->add(a:output)
    let g:make_old_output_lines += a:output->count("\n") + 1
    echo g:make_old_cmd .. ': ' .. g:make_old_output_lines .. '...'
endfunction

function make_old#close_handler(chan) abort
    if g:make_old_job->job_info().exitval
        cexpr g:make_old_output->join("\n")
    else
        echo g:make_old_cmd .. ': ' .. g:make_old_output_lines .. ' finished ok'
    endif
endfunction

function make_old#run_make(cmd, cwd) abort
    let g:make_old_output = []
    let g:make_old_output_lines = 0
    let g:make_old_cmd = a:cmd
    let g:make_old_job = job_start(a:cmd, #{
        \ cwd: a:cwd,
        \ callback: 'make_old#output_handler',
        \ close_cb: 'make_old#close_handler',
    \ })
endfunction
