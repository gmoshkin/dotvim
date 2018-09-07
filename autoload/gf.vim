function! gf#go_to_file_line_column(...)
    if exists("a:1")
        let str = a:1
    else
        let str = expand("<cWORD>")
    endif
    " echo 'str = '.str
    let fileLineCol = matchstr(str, '\f\+\(:\d\+\(:\d\+\)\?\)\?')
    " echo 'fileLineCol = '.fileLineCol
    let vals = split(fileLineCol, ":")
    if len(vals) > 0
        let fileName = vals[0]
        let path = findfile(fileName)
        " echo 'path = '.path
        if len(path) == 0
            echom 'No such file "'.fileName.'" in path'
            return
        endif
        execute "edit ".path
        if len(vals) > 1
            let l = vals[1]
            if len(vals) > 2
                let c = vals[2]
            else
                let c = 1
            endif
            " echo 'l:c = '.l . ":" . c
            call cursor(l, c)
        endif
    endif
endfunction
