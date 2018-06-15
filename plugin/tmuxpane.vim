function! s:readTmuxPane() abort
    let l:last_pane = ':.'.tmux#get_last_pane()
    let l:target_pane = input('Target Pane: ', l:last_pane)
    call tmpbuf#open_tmp_buffer(l:target_pane)
    call tmux#read_pane(l:target_pane, -999999, '$')
endfunction

nnoremap <silent> <leader>to :<c-u>call <SID>readTmuxPane()<cr>
