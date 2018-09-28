xnoremap * :<C-U>call visasterisk#set_pat('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-U>call visasterisk#set_pat('?')<CR>?<C-R>=@/<CR><CR>

if maparg('<leader>*', 'n') == ''
    nnoremap <leader>* :<C-U>call visasterisk#grep(escape(expand("<cword>"), '\'))<CR>
endif
if maparg('<leader>*', 'v') == ''
    vnoremap <leader>* :<C-U>call visasterisk#set_pat('/')<CR>:call visasterisk#grep(@/)<CR>
endif

