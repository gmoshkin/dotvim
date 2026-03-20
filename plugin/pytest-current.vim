let g:pytest_tmp_dir = '/tmp/pytest-of-gmoshkin/pytest-current/tmpcurrent/'
function! PytestCurrentFzfArguments() abort
    let l:command = []
    call add(l:command, printf('find -L %s -name "*.log" | sort -r', g:pytest_tmp_dir))
    call add(l:command, printf('find -L %s -name "*.yaml" -or -name "*.json"', g:pytest_tmp_dir))
    return {
        \ 'source': join(l:command, '; '),
        \ 'sink': 'edit',
        \ 'options': []}
endfunction

function! Trim_Match(s, p) abort
    let l:l = len(a:p)
    if len(a:s) < l:l
        return a:s
    endif
    if a:s[:l:l - 1] != a:p " RIP you fucking retard
        return a:s
    endif

    return a:s[l:l:]
endfunction

function! PytestCurrentCompletion(lead, cmdline, pos) abort
    let l:command = PytestCurrentFzfArguments()['source']
    let l:paths = system(l:command)->split('\n')
    call map(l:paths, {i, v -> Trim_Match(v, g:pytest_tmp_dir)})
    call filter(l:paths, {i, v -> stridx(v, a:lead) == 0})
    return l:paths
endfunction

function! PytestCurrent(filter) abort
    if a:filter != ''
        execute printf("edit %s%s", g:pytest_tmp_dir, a:filter)
    else
        call fzf#run(fzf#wrap(PytestCurrentFzfArguments()))
    endif
endfunction

command! -nargs=? -complete=customlist,PytestCurrentCompletion PytestCurrent call PytestCurrent(<q-args>)
