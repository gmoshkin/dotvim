if exists('*CocActionAsync')
    autocmd CursorHold * silent call CocActionAsync('highlight')
endif
highlight! link CocInlayHint NonText
highlight! link CocHintVirtualText NonText
