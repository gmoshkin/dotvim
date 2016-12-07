command! -buffer -nargs=* QfFilter call qffilter#filter_qf_results(<q-args>)

noremap <buffer> <silent> <leader>/ <ESC>:QfFilter 
