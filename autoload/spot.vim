function! spot#match_pattern(pattern)
    execute 'match TmpGroup /'.a:pattern.'/'
endfunction

function! spot#match_positions(...)
    highlight! TmpGroup ctermbg=9 ctermfg=0
    let pattern = ''

    let ls = get(a:, '1', 0)
    if ls > 0
        let pattern = pattern.'\%'.ls.'l'
    else
        return
    endif

    let cs = get(a:, '2', 0)
    if cs > 0
        let pattern = pattern.'\%'.cs.'c'
    endif

    let le = get(a:, '3', 0)
    if le > ls
        let pattern = pattern.'.*'
        for l in range(ls + 1, le)
            let pattern = pattern.'\|\%'.l.'l'
        endfor
    endif

    let ce = get(a:, '4', 0)
    if ce > 0
        let pattern = pattern.'.*\%'.ce.'c'
    endif

    call spot#match_pattern(pattern)
endfunction

function! spot#select_positions(mode, ...)
    if a:0 == 0
        return
    elseif a:0 == 1
        let pos = map(split(a:1, ','), 'utils#strip(v:val)')
    elseif a:0 == 4
        let pos = [a:1, a:2, a:3, a:4]
    endif
    if a:mode == 'v'
        if len(pos) >= 2
            call cursor(pos[0], pos[1])
            normal v
            if len(pos) >= 4
                call cursor(pos[2], pos[3])
            endif
        endif
    else
        call call('spot#match_positions', pos)
    endif
endfunction
