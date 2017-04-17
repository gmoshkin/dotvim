function! windows#go_to_window(...) abort
    if a:0 == 0 || a:1 =~ 0
        wincmd w
    elseif a:1 < 0
        wincmd W
    elseif  a:1 ==? 'r'
        if winnr() == winnr('$')
            wincmd w
        else
            wincmd l
        endif
    elseif a:1 ==? 'l'
        if winnr() == 1
            wincmd W
        else
            wincmd h
        endif
    else
        execute a:1."wincmd w"
    endif
endfunction

function! windows#exec_in_window(cmd, ...) abort
    let win = get(a:, '1', 0)
    call windows#go_to_window(win)
    execute a:cmd
endfunction

function! windows#open_full_window(...) abort
    execute join(a:000, " ")
    if winnr('$') > 2
        let wn = winnr()
        wincmd j
        if wn != winnr()
            execute (winnr()) . "close"
        endif
    else
        only
    endif
endfunction

function! windows#for_each(wincmd) abort
    let l:cur_win = winnr()
    for i in range(winnr('$'))
        wincmd b
        execute "wincmd ".a:wincmd
    endfor
    execute l:cur_win."wincmd w"
endfunction
