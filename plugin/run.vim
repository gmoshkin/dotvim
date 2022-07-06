command! -nargs=? Restart call run#restart(<q-args>)
command! -nargs=? Run call run#run_file(<q-args>)
command! -nargs=? Perl6 terminal rlwrap perl6
command! CargoRun call run#cargo('run')
command! -nargs=* Cargo call run#cargo(<f-args>)
nnoremap <silent> <leader>rr :<c-u>Run<cr>
