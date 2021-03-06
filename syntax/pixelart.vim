if exists("b:current_syntax")
    finish
endif

highlight PixelBlack ctermbg=8 ctermfg=8
syntax match PixelBlack /k/

highlight PixelWhite ctermbg=15 ctermfg=15
syntax match PixelWhite /w/

highlight PixelRed ctermbg=1 ctermfg=1
syntax match PixelRed /r/

highlight PixelYellow ctermbg=3 ctermfg=3
syntax match PixelYellow /y/

highlight PixelOrange ctermbg=9 ctermfg=9
syntax match PixelOrange /o/

highlight PixelMagenta ctermbg=5 ctermfg=5
syntax match PixelMagenta /m/

highlight PixelViolet ctermbg=13 ctermfg=13
syntax match PixelViolet /v/

highlight PixelBlue ctermbg=4 ctermfg=4
syntax match PixelBlue /b/

highlight PixelCyan ctermbg=6 ctermfg=6
syntax match PixelCyan /c/

highlight PixelGreen ctermbg=2 ctermfg=2
syntax match PixelGreen /g/

highlight PixelBase03 ctermbg=8 ctermfg=8
syntax match PixelBase03 /6/

highlight PixelBase02 ctermbg=0 ctermfg=0
syntax match PixelBase02 /7/

highlight PixelBase01 ctermbg=10 ctermfg=10
syntax match PixelBase01 /8/

highlight PixelBase00 ctermbg=11 ctermfg=11
syntax match PixelBase00 /9/

highlight PixelBase0 ctermbg=12 ctermfg=12
syntax match PixelBase0 /0/

highlight PixelBase1 ctermbg=14 ctermfg=14
syntax match PixelBase1 /1/

highlight PixelBase2 ctermbg=7 ctermfg=7
syntax match PixelBase2 /2/

highlight PixelBase3 ctermbg=15 ctermfg=15
syntax match PixelBase3 /3/

call pixelart#init_syntax()

let b:current_syntax = "pixelart"
