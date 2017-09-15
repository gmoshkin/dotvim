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

function! windows#move(ofs, ...) abort
    let l:buf_name = bufname('%')
    let l:curr_win = winnr()
    let l:dst_win_nr = (l:curr_win + a:ofs) % winnr('$')
    if l:dst_win_nr == 0
        let l:dst_win_nr = winnr('$')
    endif
    let l:dst_win_id = win_getid(l:dst_win_nr)
    let l:orientation = get(a:000, 0, 's')
    let l:relation = get(a:000, 1, 'd')
    if l:orientation == 'v'
        let l:cmd = "vsplit"
    elseif l:orientation == 's'
        let l:cmd = "split"
    else
        return
    endif
    if l:relation == 'u'
        let l:where = "aboveleft"
    elseif l:relation == 'd'
        let l:where = "belowright"
    else
        return
    endif
    close
    call win_gotoid(l:dst_win_id)
    execute join([l:where, l:cmd, l:buf_name])
endfunction
