nnoremap <Leader>hl :StageLines<CR>:GitGutter<CR>
xnoremap <Leader>hl :StageLines<CR>:GitGutter<CR>

command! -range StageLines call stagelines#stagelines(<line1>, <line2>)
