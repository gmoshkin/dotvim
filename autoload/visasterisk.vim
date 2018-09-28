" Stolen from http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
" TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
" search string, vim's search highlight will be wrong.  Refactor plz.
function! visasterisk#escape_pat(pat) abort
    let l:pat = substitute(a:pat, '\_s\+', '\\_s\\+', 'g')
    let l:pat = substitute(l:pat, '\[', '\\[', 'g')
    let l:pat = substitute(l:pat, '\~', '\\~', 'g')
    return l:pat
endfunction

function! visasterisk#set_pat(cmdtype, ...) abort
    let l:saved_reg = @"
    normal! gvy
    if !a:0 || a:1 != 'raw'
        let @" = escape(@", a:cmdtype.'\*')
    endif
    let @/ = visasterisk#escape_pat(@")
    let @" = l:saved_reg
endfunction

function! visasterisk#grep(pat) abort
    execute printf('noautocmd vimgrep /\C%s/ %s/**',
                 \ visasterisk#escape_pat(a:pat),
                 \ misc#curr_dir())
endfunction
