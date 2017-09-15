" the leading 'm' stands for 'make'. should be usefull to make mappings starting
" with 'm' for different file types. maybe I should come up with a better
" mnemonic
noremap <buffer> <leader>mc <ESC>:make<CR>
noremap <buffer> <leader>me <ESC>:execute "!".expand("%:p:r").".exe"<CR>
setlocal makeprg=mcs\ %\ $*
setlocal errorformat=%f(%l\\,%c):\ %trror\ %m
setlocal indentexpr=cindent#cindent(line('.'))
