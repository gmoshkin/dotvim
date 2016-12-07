function! stagelines#stagelines(ls, le)
    let hunk = gitgutter#hunk#current_hunk()
    if len(hunk) != 4
        return
    endif

    let orig_line = line('.')
    let orig_col = col('.')

    let lines_to_stage = utils#get_lines(a:ls, a:le)

    let [ols, oln, nls, nln] = hunk
    let nle = nls + nln - 1
    let hunk_lines = utils#get_lines(nls, nle)

    " Delete the hunk
    silent execute nls.','.nle.'d'
    " Insert the lines to be staged
    call append(nls - 1, lines_to_stage)

    " Put the cursor inside the hunk and stage it
    call cursor(nls, 0)
    call gitgutter#stage_hunk()

    " Undo file modifications
    silent undo
    silent write
    call cursor(orig_line, orig_col)
endfunction
