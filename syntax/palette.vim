if exists("b:current_syntax")
    finish
endif

highlight base03Value ctermbg=8 ctermfg=12
syntax match base03Value /\c#002b36\>/
highlight base03Text ctermbg=12 ctermfg=8
syntax match base03Text /\c\<base03\>/

highlight base02Value ctermbg=0 ctermfg=8
syntax match base02Value /\c#073642\>/
highlight base02Text ctermfg=0
syntax match base02Text /\c\<base02\>/

highlight base01Value ctermbg=10 ctermfg=8
syntax match base01Value /\c#586E75\>/
highlight base01Text ctermfg=10
syntax match base01Text /\c\<base01\>/

highlight base00Value ctermbg=11 ctermfg=8
syntax match base00Value /\c#657B83\>/
highlight base00Text ctermfg=11
syntax match base00Text /\c\<base00\>/

highlight base0Value ctermbg=12 ctermfg=8
syntax match base0Value /\c#839496\>/
highlight base0Text ctermfg=12
syntax match base0Text /\c\<base0\>/

highlight base1Value ctermbg=14 ctermfg=8
syntax match base1Value /\c#93A1A1\>/
highlight base1Text ctermfg=14
syntax match base1Text /\c\<base1\>/

highlight base2Value ctermbg=7 ctermfg=8
syntax match base2Value /\c#EEE8D5\>/
highlight base2Text ctermfg=7
syntax match base2Text /\c\<base2\>/

highlight base3Value ctermbg=15 ctermfg=8
syntax match base3Value /\c#FDF6E3\>/
highlight base3Text ctermfg=15
syntax match base3Text /\c\<base3\>/

highlight yellowValue ctermbg=3 ctermfg=8
syntax match yellowValue /\c#B58900\>/
highlight yellowText ctermfg=3
syntax match yellowText /\c\<yellow\>/

highlight orangeValue ctermbg=9 ctermfg=8
syntax match orangeValue /\c#cb4b16\>/
highlight orangeText ctermfg=9
syntax match orangeText /\c\<orange\>/

highlight redValue ctermbg=1 ctermfg=8
syntax match redValue /\c#DC322F\>/
highlight redText ctermfg=1
syntax match redText /\c\<red\>/

highlight magentaValue ctermbg=5 ctermfg=8
syntax match magentaValue /\c#D33682\>/
highlight magentaText ctermfg=5
syntax match magentaText /\c\<magenta\>/

highlight violetValue ctermbg=13 ctermfg=8
syntax match violetValue /\c#6C71C4\>/
highlight violetText ctermfg=13
syntax match violetText /\c\<violet\>/

highlight blueValue ctermbg=4 ctermfg=8
syntax match blueValue /\c#268BD2\>/
highlight blueText ctermfg=4
syntax match blueText /\c\<blue\>/

highlight cyanValue ctermbg=6 ctermfg=8
syntax match cyanValue /\c#2AA198\>/
highlight cyanText ctermfg=6
syntax match cyanText /\c\<cyan\>/

highlight greenValue ctermbg=2 ctermfg=8
syntax match greenValue /\c#859900\>/
highlight greenText ctermfg=2
syntax match greenText /\c\<green\>/


let b:current_syntax = "palette"
