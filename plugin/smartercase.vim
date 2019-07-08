" Forget about it, ignorecase fucking sucks, it messes up literally everything!

" noremap <silent> gd :<c-u>call smartercase#normal("gd")<cr>
" noremap <silent> gD :<c-u>call smartercase#normal("gD")<cr>

" when jumping to the tag prompt for selection if there are several matches
" nnoremap <silent> <C-]> :<C-U>call utils#save_option_do("ignorecase", "tjump ".expand("<cword>"))<CR>

" * and # should always search case sensitive
" if &ignorecase == 1
"     nnoremap * /\C\<<C-R><C-W>\><CR>
"     nnoremap # ?\C\<<C-R><C-W>\><CR>
" endif

" case (in)sensitive searching with ctrl + / and ctrl + ?
" if &ignorecase == 1
"     nnoremap <C-_> /\C
"     nnoremap <C-?> ?\C
" else
"     nnoremap <C-_> /\c
"     nnoremap <C-?> ?\c
" endif
"
nnoremap / /\c
