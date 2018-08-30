command! AddPat call addpat#add('n')
nnoremap <silent> + :<C-U>AddPat<CR>
vnoremap <silent> + :<C-U>call addpat#add('v')<CR>
