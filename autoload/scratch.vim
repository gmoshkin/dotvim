function! scratch#count_open_buffers() abort
    return len(filter(getbufinfo(), {
                \k, v -> getbufvar(v.name, '&filetype') == 'scratch'
            \}))
endfunction

let s:scratch_nr = 0

function! scratch#open(mods, cmd) abort
    let l:name = 'scratch '.s:scratch_nr
    let s:scratch_nr += 1
    exe a:mods . ' new +setfiletype\ scratch ' . l:name
    if !empty(a:cmd)
        call appendbufline(l:name, 0, split(execute(a:cmd), '\n'))
    endif
endfunction
