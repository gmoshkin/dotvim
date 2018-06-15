function! tmpbuf#open_tmp_buffer(name) abort
    let l:options = 'bufhidden=wipe\ buftype=nofile'
    let l:prefix = 'belowright'
    execute l:prefix.' new +set\ '.l:options.' '.a:name
endfunction
