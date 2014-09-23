if exists("b:current_syntax")
  finish
endif

highlight loglogStar ctermfg=green
syntax match logStar /\*\*\*\*\*\*\*\*/

highlight logGrind ctermfg=yellow
syntax match logGrind /...grind/

highlight logScore ctermfg=blue
highlight logClosingNumber ctermfg=red
syntax match logClosingNumber /[0-9]\+/ contained
syntax match logScore /score.*/ contains=ClosingNumber

highlight logIteration ctermfg=6
syntax match logIteration /Iteration [0-9]*\./

highlight logExploit ctermfg=10
syntax match logExploit /exploit_[0-9]*_[0-9]*/

highlight logErroDetected ctermfg=1
syntax match logErroDetected /Error detected\./

highlight logSignal ctermbg=1
syntax match logSignal /SIG[A-Z]\+/

let b:current_syntax = "log"
