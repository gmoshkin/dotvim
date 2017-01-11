setlocal spell

iabbrev <buffer> -- &mdash;

nnoremap <silent> <buffer> crh :<c-u>call markdown#change_to_heading()<cr>
