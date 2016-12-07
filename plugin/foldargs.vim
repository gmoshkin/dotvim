function! s:fold_arguments_onto_multiple_lines()
    substitute/,\s*/,\r/ge
    normal v``="
endfunction

noremap <Leader>( <ESC>:call <SID>fold_arguments_onto_multiple_lines()<CR>
