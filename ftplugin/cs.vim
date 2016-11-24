" the leading 'm' stands for 'make'. should be usefull to make mappings starting
" with 'm' for different file types. maybe I should come up with a better
" mnemonic
noremap <buffer> <leader>mc <ESC>:!mcs %:p<CR>
noremap <buffer> <leader>me <ESC>:execute "!".expand("%:r").".exe"<CR>
