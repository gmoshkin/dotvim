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

function! pixelart#print_line_hex(list) abort
    let l:cmd = ""
    for hex in a:list
        if hex == ' '
            let color = ""
        else
            let color = "PixelCterm".(pixelart#hexcolor2cterm(hex) + 16)
        endif
        let l:cmd .= "echohl ".color."|echon '  '|"
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

function! pixelart#show(lines, mode) abort
    let l:funcs = {
        \16 : funcref("pixelart#print_line_16"),
        \256 : funcref("pixelart#print_line_256"),
        \"hex" : funcref("pixelart#print_line_hex")
    \}
    let l:PrintLine = l:funcs[a:mode]
    if type(a:lines[0]) == v:t_list || a:mode == 16
        call pixelart#print_lines(a:lines, l:PrintLine)
    else
        call l:PrintLine(a:lines)
    endif
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

function! pixelart#hex2num(hex) abort
    return '0x'.a:hex + 0
endfunction

function! pixelart#hexcolor2cterm(hex) abort
    if a:hex[0] == '#'
        let l:hex = a:hex[1:]
    else
        let l:hex = a:hex
    endif
    let ratio = 256.0 / 6
    let r = float2nr(pixelart#hex2num(l:hex[0:1]) / ratio)
    let g = float2nr(pixelart#hex2num(l:hex[2:3]) / ratio)
    let b = float2nr(pixelart#hex2num(l:hex[4:5]) / ratio)
    return r * 36 + g * 6 + b
endfunction
