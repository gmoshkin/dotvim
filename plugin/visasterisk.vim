xnoremap * :<C-U>call visasterisk#set_pat('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-U>call visasterisk#set_pat('?')<CR>?<C-R>=@/<CR><CR>

nnoremap <leader>* :<C-U>call visasterisk#grep_curr(escape(expand("<cword>"), '\'))<CR>
vnoremap <leader>* :<C-U>call visasterisk#set_pat('/')<CR>:call visasterisk#grep_curr(@/)<CR>
nnoremap <leader>- :<C-U>call visasterisk#grep_higher()<CR>
