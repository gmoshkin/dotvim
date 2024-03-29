noremap <leader>gb :<C-U>Git blame<CR>
noremap <leader>gcc :<C-U>above Git commit<CR>
noremap <leader>gca :<C-U>above Git commit --amend<CR>
" Mnemonic Git Push Up/Pull Down
if exists(':Gitpush')
    noremap <leader>gpu :<C-U>Gitpush<CR>
else
    noremap <leader>gpu :<C-U>Git push<CR>
endif
noremap <leader>gpd :<C-U>Git pull<CR>
" The action is related to pushing so the prefix is the same
noremap <leader>gpr :<C-U>Git review<CR>
noremap <leader>gs :<C-U>aboveleft Git!<CR>
" Mnemonic Git Reserve Save/Pop
" noremap <leader>grs :<C-U>Git stash save<CR>
" noremap <leader>grp :<C-U>Git stash pop<CR>
noremap <leader>gu :<C-U>Git reset %:p<CR>:edit<CR>:redraw<CR>:echo 'Git reset '.misc#curr_path()<CR>
noremap <leader>ge :<C-U>Ge<CR>
noremap <leader>gw :<C-U>Gwrite<CR>
noremap <leader>gl :<C-U>Gitlog<CR>
noremap <leader>gL :<C-U>Gitlog -150<CR>

nnoremap <leader>gg :<C-U>Ggrep <cword><CR>
vnoremap <leader>gg "gy:<C-U>Ggrep <C-R>g<CR>
