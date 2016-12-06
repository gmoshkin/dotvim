noremap <leader>gb :<C-U>Gblame<CR>
noremap <leader>gcc :<C-U>Gcommit<CR>
noremap <leader>gca :<C-U>Gcommit --amend<CR>
" Mnemonic Git Push Up/Pull Down
noremap <leader>gpu :<C-U>Gpush<CR>
noremap <leader>gpd :<C-U>Gpull<CR>
noremap <leader>gs :<C-U>Gstatus<CR>
" Mnemonic Git Reserve Save/Pop
noremap <leader>grs :<C-U>Git stash save<CR>
noremap <leader>grp :<C-U>Git stash pop<CR>
noremap <leader>gu :<C-U>Git reset %:p<CR>:edit<CR>:redraw<CR>:echo 'Git reset '.expand('%:p')<CR>
noremap <leader>gw :<C-U>Gwrite<CR>

nnoremap <leader>gg :<C-U>Ggrep <cword><CR>
vnoremap <leader>gg "gy:<C-U>Ggrep <C-R>g<CR>
