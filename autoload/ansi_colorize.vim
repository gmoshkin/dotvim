let s:baleia = luaeval("require('baleia').setup { }")
function! ansi_colorize#do_current_buffer() abort
    call s:baleia.once(bufnr('%'))
endfunction
