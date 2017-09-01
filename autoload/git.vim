function! git#run_command(command, argument)
    execute join(['Git', a:command, a:argument], ' ')
endfunction

function! git#process_argument(argument)
    if a:argument =~ '^[0-9]\+$'
        return 'HEAD~'.a:argument
    else
        return a:argument
    endif
endfunction
