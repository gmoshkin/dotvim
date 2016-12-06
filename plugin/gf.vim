noremap <leader>gf :<C-U>call windows#go_to_window(v:count)<BAR>gf#go_to_file_line_column <C-R><C-F><CR>
noremap <leader>gF :<C-U>call windows#go_to_window(v:count)<BAR>gf#go_to_file_line_column <C-R><C-A><CR>

command! -nargs=* GoToFileLineColumn call gf#go_to_file_line_column(<q-args>)
