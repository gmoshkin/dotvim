setlocal spell
setlocal wrap

iabbrev <buffer> -- —
iabbrev <buffer> —- ---

nnoremap <silent> <Plug>MarkdownChangeHeading :<c-u>call markdown#change_to_heading()<cr>
nmap <buffer> crh <Plug>MarkdownChangeHeading

nnoremap <buffer> <CR> gqq
vnoremap <buffer> <CR> JVgq
