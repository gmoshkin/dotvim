function! execlines#strip_comment_from_function(idx, value)
    return substitute(a:value, '^\s*fu.*\zs".*', '', '')
endfunction

function! execlines#execlines(ls, le) abort
    let lines = utils#get_lines(a:ls, a:le)
    call map(lines, function("execlines#strip_comment_from_function"))
    let command = join(lines, "\n")
    exec command
endfunction
