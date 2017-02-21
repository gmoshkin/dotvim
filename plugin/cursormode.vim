if has('win32')
    finish
endif

augroup CursorMode
    autocmd VimEnter,InsertLeave * call cursormode#set_cursor_mode('n')
    autocmd InsertEnter,InsertChange * call cursormode#set_cursor_mode(v:insertmode)
    autocmd VimLeave * call cursormode#set_cursor_mode('d')
augroup END
