function! misc#echo_args(...)
    if exists("a:000")
        echo a:000
    else
        echo "no args"
    endif
endfunction
