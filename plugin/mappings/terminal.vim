if !has('terminal')
    finish
endif
tnoremap <C-W><C-I> <C-W>N
tnoremap <C-W><C-U> <C-W>N<C-U>
tnoremap <C-W><C-W> <C-W>.

tnoremap <C-W><C-P> <C-W>:bp<CR>
tnoremap <C-W><C-N> <C-W>:bn<CR>
nnoremap <C-W><C-P> :<C-U>bp<CR>
nnoremap <C-W><C-N> :<C-U>bn<CR>

tnoremap <C-W>; <C-W>:
nnoremap <C-W>; :

tnoremap <C-W><C-Y> <C-W>""
nnoremap <C-W><C-I> i
