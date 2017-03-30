if exists("b:current_syntax")
    finish
endif

highlight base03Value ctermbg=12 ctermfg=8
syntax match base03Value /\c-16766154\>/
highlight base03Text ctermbg=12 ctermfg=8
syntax match base03Text /\c\<base03\>/

highlight base02Value ctermbg=8 ctermfg=0
syntax match base02Value /\c-16304574\>/
highlight base02Text ctermfg=0
syntax match base02Text /\c\<base02\>/

highlight base01Value ctermbg=8 ctermfg=10
syntax match base01Value /\c-10981771\>/
highlight base01Text ctermfg=10
syntax match base01Text /\c\<base01\>/

highlight base00Value ctermbg=8 ctermfg=11
syntax match base00Value /\c-10126461\>/
highlight base00Text ctermfg=11
syntax match base00Text /\c\<base00\>/

highlight base0Value ctermbg=8 ctermfg=12
syntax match base0Value /\c-8153962\>/
highlight base0Text ctermfg=12
syntax match base0Text /\c\<base0\>/

highlight base1Value ctermbg=8 ctermfg=14
syntax match base1Value /\c-7102047\>/
highlight base1Text ctermfg=14
syntax match base1Text /\c\<base1\>/

highlight base2Value ctermbg=8 ctermfg=7
syntax match base2Value /\c-1120043\>/
highlight base2Text ctermfg=7
syntax match base2Text /\c\<base2\>/

highlight base3Value ctermbg=8 ctermfg=15
syntax match base3Value /\c-133405\>/
highlight base3Text ctermfg=15
syntax match base3Text /\c\<base3\>/

highlight yellowValue ctermbg=8 ctermfg=3
syntax match yellowValue /\c-4880128\>/
highlight yellowText ctermfg=3
syntax match yellowText /\c\<yellow\>/

highlight orangeValue ctermbg=8 ctermfg=9
syntax match orangeValue /\c-3454186\>/
highlight orangeText ctermfg=9
syntax match orangeText /\c\<orange\>/

highlight redValue ctermbg=8 ctermfg=1
syntax match redValue /\c-2346449\>/
highlight redText ctermfg=1
syntax match redText /\c\<red\>/

highlight magentaValue ctermbg=8 ctermfg=5
syntax match magentaValue /\c-2935166\>/
highlight magentaText ctermfg=5
syntax match magentaText /\c\<magenta\>/

highlight violetValue ctermbg=8 ctermfg=13
syntax match violetValue /\c-9670204\>/
highlight violetText ctermfg=13
syntax match violetText /\c\<violet\>/

highlight blueValue ctermbg=8 ctermfg=4
syntax match blueValue /\c-14251054\>/
highlight blueText ctermfg=4
syntax match blueText /\c\<blue\>/

highlight cyanValue ctermbg=8 ctermfg=6
syntax match cyanValue /\c-13983336\>/
highlight cyanText ctermfg=6
syntax match cyanText /\c\<cyan\>/

highlight greenValue ctermbg=8 ctermfg=2
syntax match greenValue /\c-8021760\>/
highlight greenText ctermfg=2
syntax match greenText /\c\<green\>/


let b:current_syntax = "attheme"
