function! pixelart#print_line_16(str) abort
    let l:cmd = ""
    for i in range(len(a:str))
        let l:cmd .= "echohl ".g:color_pixels[a:str[i]]."|echon '  '|"
    endfor
    let l:cmd .= "echohl"
    execute l:cmd
endfunction

function! pixelart#print_line_256(list) abort
    let l:cmd = ""
    for i in a:list
        let l:cmd .= "echohl PixelCterm".i."|echon '  '|"
    endfor
    let l:cmd .= "echohl"
    execute l:cmd
endfunction

function! pixelart#print_lines(lines, print_lines) abort
    for i in range(len(a:lines) - 1)
        call a:print_lines(a:lines[i])
        echon "\n"
    endfor
    call a:print_lines(a:lines[-1])
endfunction

function! pixelart#show(lines, n_colors) abort
    if a:n_colors == 16
        let l:PrintLines = funcref("pixelart#print_line_16")
    elseif a:n_colors == 256
        let l:PrintLines = funcref("pixelart#print_line_256")
    endif
    call pixelart#print_lines(a:lines, l:PrintLines)
endfunction

function! pixelart#match_color(num, pattern, syntax) abort
    execute "highlight PixelCterm".a:num." ctermbg=".a:num." ctermfg=".a:num
    if a:syntax
        execute "syntax match PixelCterm".a:num." /".a:pattern."/"
    endif
endfunction

function! pixelart#init_highlights() abort
    for i in range(1, 256)
        call pixelart#match_color(i, nr2char(i), 0)
    endfor
endfunction

function! pixelart#init_syntax() abort
    for i in range(1, 256)
        call pixelart#match_color(i, nr2char(i), 1)
    endfor
endfunction
