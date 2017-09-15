function! s:windows_fix_layout() abort
    if winnr('$') > 3
        return
    endif
    wincmd =
    if &columns < 2 * &textwidth
        WindowsLayoutVertical
    else
        WindowsLayoutHorizontal
    endif
endfunction

command! WindowsFixLayout call s:windows_fix_layout()
command! WindowsLayoutVertical call windows#for_each('K')
command! WindowsLayoutHorizontal call windows#for_each('H')

augroup WindowLayout
    autocmd! VimResized * WindowsFixLayout
augroup END

nnoremap <silent> <C-W>m :<c-u>call windows#move(1, 's')
nnoremap <silent> <C-W>M :<c-u>call windows#move(-2, 's')
