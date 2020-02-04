vim9script

def make#output_handler(chan: channel, output: string)
    g:make_output->add(output)
    g:make_output_lines += output->count("\n") + 1
    echo g:make_cmd .. ': ' .. g:make_output_lines .. '...'
enddef

def make#close_handler(chan: channel)
    if g:make_job->job_info().exitval
        cexpr g:make_output->join("\n")
    else
        echo g:make_cmd .. ': ' .. g:make_output_lines .. ' finished ok'
    endif
enddef

def make#run_make(cmd: string, cwd: string = '.')
    g:make_output = []
    g:make_output_lines = 0
    g:make_cmd = cmd
    g:make_job = job_start(cmd, #{
        \ cwd: cwd,
        \ callback: 'make#output_handler',
        \ close_cb: 'make#close_handler',
    \ })
enddef
