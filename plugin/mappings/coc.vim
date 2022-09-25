nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>gt :<c-u>call CocActionAsync('doHover')<cr>
nnoremap <leader>gT <Plug>(coc-type-definition)
nnoremap <leader>gu <Plug>(coc-references-used)

nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

inoremap <expr> <c-f> coc#pum#visible() ? coc#pum#confirm() : "<right>"

function GotoPopupOrNextWindow() abort
    try
        if coc#float#has_float()
            call coc#float#jump()
            return
        endif
    catch /:E117:/
    endtry
    wincmd w
endfunction

nnoremap <c-w><c-w> :<c-u>call GotoPopupOrNextWindow()<cr>
