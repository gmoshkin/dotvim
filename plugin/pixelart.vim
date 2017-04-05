let g:color_pixels = {
        \ '0' : 'PixelBase0',
        \ '1' : 'PixelBase1',
        \ '2' : 'PixelBase2',
        \ '3' : 'PixelBase3',
        \ '9' : 'PixelBase00',
        \ '8' : 'PixelBase01',
        \ '7' : 'PixelBase02',
        \ '6' : 'PixelBase03',
        \ 'r' : 'PixelRed',
        \ 'o' : 'PixelOrange',
        \ 'y' : 'PixelYellow',
        \ 'g' : 'PixelGreen',
        \ 'b' : 'PixelBlue',
        \ 'c' : 'PixelCyan',
        \ 'v' : 'PixelViolet',
        \ 'm' : 'PixelMagenta',
        \ 'k' : 'PixelBlack',
        \ 'w' : 'PixelWhite',
        \ ' ' : ''
    \}

let g:pixelart_mario = [
    \"      rrrrr  111",
    \"     rrrrrrrrr11",
    \"     8881171 rrr",
    \"    8181117111rr",
    \"    81881117111r",
    \"    8811117777r",
    \"      1111111rr",
    \"111rrrrbrrrbrr  8",
    \"111rrrrrbrrrb  88",
    \" 1   rrrbbbbybb88",
    \"      bbbybbbbb88",
    \"    88bbbbbbbbb88",
    \"   888bbbbbb",
    \"   88"
\]

let g:pixelart_mario_2 = [
    \"   rrrrrr",
    \"  rrrrrrrrrr",
    \"  88811171",
    \" 81811117111",
    \" 818811117111",
    \" 88111117777",
    \"   11111111",
    \"  rrbrrrr",
    \" rrrbrrbrrr",
    \"rrrrbbbbrrrr",
    \"11rbybbybr11",
    \"111bbbbbb111",
    \"11bbbbbbbb11",
    \"  bbb  bbb",
    \" 888    888",
    \"8888    8888",
\]

function! Mario() abort
    call pixelart#show(g:pixelart_mario, 16)
    sleep 1
    redraw
    call pixelart#show(g:pixelart_mario_2, 16)
endfunction

function! ShowColors() abort
    let start = 16
    let step = 6
    let colors = []
    for i in range(start, 256, step)
        let tmp = []
        for j in range(i, i + step - 1)
            call add(tmp, j)
        endfor
        call add(colors, tmp)
    endfor
    call pixelart#show(colors, 256)
endfunction
