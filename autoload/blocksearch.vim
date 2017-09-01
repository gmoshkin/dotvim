function! blocksearch#search(word, bang)
    let pos = misc#get_cursor_position()
    silent execute "normal viB"
    call misc#set_cursor_position(pos)
    let flags = ""
    if a:bang == "!"
        let search_cmd = "?"
    else
        let search_cmd = "/"
    endif
    execute search_cmd.'\%V'.a:word
endfunction
