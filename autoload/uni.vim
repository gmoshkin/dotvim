function! uni#do_ascii() abort
    let l:ascii = execute('ascii')
    let [l:ascii; _] = split(l:ascii, '\n')
    let l:str = getline('.')[col('.')-1:]
    if empty(l:str)
        return l:ascii
    else
        let l:uniname = system('perl6 -e "words.head.uniname.say"', l:str)
        let [l:uniname; _] = split(l:uniname, '\n')
        return printf("%s, Uniname %s", l:ascii, l:uniname)
    endif
endfunction
