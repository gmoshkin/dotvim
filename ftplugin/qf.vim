command! -buffer -nargs=*        QfFilter call qffilter#filter_qf_results(<q-args>)
command! -buffer -nargs=* -range QfRemove call qffilter#remove_line(<line1>, <line2>)

noremap <buffer> <silent> <leader>/ <ESC>:QfFilter 
nnoremap <buffer> <silent> dd :QfRemove<CR>
nnoremap <buffer> <silent> u :<C-U>colder<CR>
nnoremap <buffer> <silent> <C-R> :<C-U>cnewer<CR>
vnoremap <buffer> <silent> d :<C-U>call qffilter#remove_line(line("'<"), line("'>"))<CR>
