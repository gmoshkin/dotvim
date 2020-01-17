function! ShouldMatchWhitespace()
    if &buftype ==# 'terminal'
        return 0
    endif
    for ft in g:extra_whitespace_ignored_filetypes
        if ft ==# &filetype | return 0 | endif
    endfor
    return 1
endfunction
