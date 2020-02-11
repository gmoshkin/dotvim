function make_old#output_handler(chan, output) abort
    eval g:make_old_output->add(a:output)
    let g:make_old_output_lines += a:output->count("\n") + 1
    let l:output_lines = a:output->split("\n")
    let l:last_line = l:output_lines->len() > 0 ? l:output_lines[-1] : ''
    echo g:make_old_cmd .. ': ' .. g:make_old_output_lines .. ': ' .. l:last_line
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
    if a:cmd->type() == v:t_list
        let g:make_old_cmd = a:cmd->join(' ')
    else
        let g:make_old_cmd = a:cmd
    endif
    let g:make_old_job = job_start(['/bin/sh', '-c', a:cmd], #{
        \ cwd: a:cwd,
        \ callback: 'make_old#output_handler',
        \ close_cb: 'make_old#close_handler',
    \ })
endfunction
