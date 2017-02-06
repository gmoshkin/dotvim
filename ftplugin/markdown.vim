setlocal spell
setlocal wrap

iabbrev <buffer> -- —
iabbrev <buffer> —- ---

nnoremap <silent> <Plug>MarkdownChangeHeading :<c-u>call markdown#change_to_heading()<cr>
nmap <buffer> crh <Plug>MarkdownChangeHeading

nnoremap <buffer> <CR> gqq
vnoremap <buffer> <CR> JVgq

augroup MarkdownAutoFormat
    autocmd! InsertEnter <buffer> call toggle#auto_format(1, 0)
    autocmd! InsertLeave <buffer> call toggle#auto_format(0, 0)
augroup END
