noremap <buffer> <Leader>mp <ESC>:!pdflatex %:p<CR>
noremap <buffer> <Leader>mb <ESC>:execute '!bibtex '.split(expand('%:p'), '\.')[0].'.aux'<CR>
" noremap <buffer> <C-S> <ESC>:update<CR>:!pdflatex %:p<CR>
" inoremap <buffer> <C-S> <C-O>:update<CR><C-O>:!pdflatex %:p<CR>
" vnoremap <buffer> <C-S> <C-C>:update<CR>:!pdflatex %:p<CR>

setlocal spell
call toggle#auto_format(1, 0)
