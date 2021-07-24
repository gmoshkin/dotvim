if exists("g:loaded_insert_undo_mappings")
    finish
endif

function s:prepend(key, mapping, mode)
    let mapdict = maparg(a:key, a:mode, 0, 1)
    if empty(mapdict)
        execute a:mode."noremap ".a:key." ".a:mapping.a:key
        return
    endif
    let mapping = mapdict["rhs"]
    if mapdict["buffer"]
        silent execute a:mode."unmap <buffer> ".a:key
        let mapdict = maparg(a:key, a:mode, 0, 1)
        let mapping = get(mapdict, "rhs", mapping)
    endif
    if mapping[:len(a:mapping) - 1] !=# a:mapping
        execute a:mode."map ".a:key." ".a:mapping.mapping
    endif
endfunction

let s:keys = [
    \ "<Space>",
    \ "<CR>",
    \ "<C-H>",
    \ "<BS>",
    \ "<C-W>",
    \ "<C-U>",
    \]

for k in s:keys
    call <SID>prepend(k, "<C-G>u", "i")
endfor

let g:loaded_insert_undo_mappings = 1
