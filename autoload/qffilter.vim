" Stole it from codequery plugin
function! qffilter#filter_qf_results(args) abort
    let args = split(a:args, ' ')
    if len(args) > 1
        let query = args[1]
        let reverse_filter = 1
    else
        let query = args[0]
        let reverse_filter = 0
    endif
    echom query

    let qf_list = getqflist()
    for qf_row in qf_list
        if reverse_filter
            if bufname(qf_row['bufnr']) =~ query || qf_row['text'] =~ query
                call remove(qf_list, index(qf_list, qf_row))
            endif
        else
            if bufname(qf_row['bufnr']) !~ query && qf_row['text'] !~ query
                call remove(qf_list, index(qf_list, qf_row))
            endif
        endif
    endfor
    call setqflist(qf_list)
endfunction

function! qffilter#remove_line(line, ...) abort
    let oldLine = line('.')
    let oldCol = col('.')
    let qf_list = getqflist()
    let start = a:line - 1
    if a:0 > 0
        let end = a:1 - 1
    else
        let end = start
    endif
    call remove(qf_list, start, end)
    call setqflist(qf_list)
    call cursor(oldLine, oldCol)
endfunction
