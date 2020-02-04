function! cursormode#set_cursor_mode(mode)
    if get(g:, 'in_multi_cursor_mode', 0)
        return
    endif
    let g:cursor_modes = {
      \ 'd' : '1',
      \ 'n' : '1',
      \ 'i' : '5',
      \ 'r' : '3',
      \ 'v' : '3',
      \ }
    silent execute '!echo -ne "\e['.g:cursor_modes[a:mode].' q"'
    redraw!
endfunction
