if exists('g:vscode')
    finish
endif

nnoremap <silent> <ESC>b :<C-U>call subword#subword_move("b", 'n')<CR>
nnoremap <silent> <ESC>w :<C-U>call subword#subword_move("w", 'n')<CR>
nnoremap <silent> <ESC>e :<C-U>call subword#subword_move("e", 'n')<CR>
vnoremap <silent> <ESC>b :<C-U>call subword#subword_move("b", 'v')<CR>
vnoremap <silent> <ESC>w :<C-U>call subword#subword_move("w", 'v')<CR>
vnoremap <silent> <ESC>e :<C-U>call subword#subword_move("e", 'v')<CR>
