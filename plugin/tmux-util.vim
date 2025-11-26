command! CrawlLocations call setqflist(json_decode(system('/home/gmoshkin/dotfiles/tmux/tmux-util-linux crawl-locations --json --need-line "{last}"'))) | cfirst
nnoremap <leader>qt :<c-u>CrawlLocations<cr>
