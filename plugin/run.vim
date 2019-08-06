command! -nargs=? Restart call run#restart(<q-args>)
command! -nargs=? Run call run#run_file(<q-args>)
nnoremap <silent> <leader>rr :<c-u>Run<cr>
