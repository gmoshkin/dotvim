function! <SID>openbox_mappings() abort
    nnoremap <buffer> <leader>E :<C-U>!openbox --reconfigure<CR>
endfunction

augroup OpenBox
    autocmd BufNewFile,BufRead *lubuntu-rc.xml call <SID>openbox_mappings()
augroup END
