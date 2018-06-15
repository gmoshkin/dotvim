function! tmux#get_last_pane() abort
    return system('tmux display-message -p -t {last} "#P"') + 0
endfunction

function! tmux#get_pane(pane, s, e) abort
    return system('tmux capture-pane -t '.a:pane.' -p -S '.a:s.' -E '.a:e)
endfunction

function! tmux#read_pane(pane, s, e) abort
    let l:cmd = '%!tmux capture-pane -p -t '.a:pane
    if a:s != '^'
        let l:cmd = l:cmd . ' -S '.a:s
    endif
    if a:e != '$'
        let l:cmd = l:cmd . ' -E '.a:e
    endif
    execute l:cmd
endfunction

function! tmux#_read_pane(pane, ...) abort
    let l:cmd = 'tmux display-message -p -t '.a:tmuxpane.' "#{pane_height}"'
    let l:pane_height = system(l:cmd)
    echo 'pane "'.a:tmuxpane.'" has height '.l:pane_height
    let l:start = 0
    let l:end = l:pane_height - 1
    echo 'pane contents: "'.GetPage(a:tmuxpane, l:start - l:pane_height, l:end - l:pane_height).GetPage(a:tmuxpane, l:start, l:end).'"'
endfunction
