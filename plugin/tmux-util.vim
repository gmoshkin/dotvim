if has('nvim')
    luafile <sfile>:h/tmux-util.lua
endif

function! GetCrawlLocations() abort
    return json_decode(system('~/dotfiles/tmux/tmux-util crawl-locations --json --need-line "{last}"'))
endfunction

function! SetQfListFromCrawlLocations(go) abort
    let l:data = GetCrawlLocations()
    call filter(l:data, {i, row -> file_readable(row['filename'])})
    let l:first_error = indexof(l:data, {i, v -> get(v, 'type', '') == 'E'})
    call setqflist(l:data)
    if a:go && l:first_error != -1
        execute 'cfirst ' . (l:first_error + 1)
    elseif a:go
        cfirst
        if exists(':QFShowInfo')
            QFShowInfo
        endif
    endif
endfunction

command! CrawlLocations call SetQfListFromCrawlLocations(v:true)

nnoremap <leader>qt :<c-u>CrawlLocations<cr>

nnoremap <silent> [q :<c-u>cprev<cr>:<c-u>silent QFShowInfo<cr>
nnoremap <silent> ]q :<c-u>cnext<cr>:<c-u>silent QFShowInfo<cr>
