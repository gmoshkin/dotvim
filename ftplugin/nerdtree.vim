setlocal ts=2
setlocal sw=2

nnoremap <buffer> <silent> - :<C-U>call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapUpdir)<CR>
