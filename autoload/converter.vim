function! converter#get_iword() abort
    let l:pos = getcurpos()
    let l:a_saved = @a
    normal! "ayiw
    let l:result = @a
    let @a = l:a_saved
    call cursor(l:pos[1:])
    return l:result
endfunction

function! converter#put_iword(word) abort
    let l:a_saved = @a
    normal! "_diw
    let @a = a:word
    if getcurpos()[2] == len(getline('.'))
        normal! "ap
    else
        normal! "aP
    endif
    let @a = l:a_saved
endfunction

function! converter#get_word_kind(word) abort
    if a:word =~# '^0x[a-fA-F0-9]\+$'
        return 'x'
    elseif a:word =~# '^\d\+$'
        return 'd'
    else
        return ''
    endif
endfunction

function! converter#convert_iword() abort
    let l:word = converter#get_iword()
    let l:kind = converter#get_word_kind(l:word)
    if l:kind == 'x'
        call converter#put_iword(printf("%d", l:word))
    elseif l:kind == 'd'
        call converter#put_iword(printf("0x%x", l:word))
    endif
endfunction
