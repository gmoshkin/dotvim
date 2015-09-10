if exists("b:current_syntax")
  finish
endif

highlight loglogStar ctermfg=green
syntax match logStar /\*\*\*\*\*\*\*\*/

highlight logGrind ctermfg=yellow
syntax match logGrind /\w*grind/

highlight logScore ctermfg=blue
highlight logClosingNumber ctermfg=red
syntax match logClosingNumber /[0-9]\+/ contained
syntax match logScore /score.*/ contains=ClosingNumber

highlight logIteration ctermfg=4
syntax match logIteration /Iteration [0-9]*\..*/

highlight logDateTime ctermfg=magenta
syntax match logDateTime /[A-Z][a-z]\{2}\s\+[A-Z][a-z]\{2}\s\+\d\{1,2}\s\+\d\d:\d\d:\d\d\s\+\d\{4}/

highlight logExploit ctermfg=2
syntax match logExploit /exploit_[0-9]*_[0-9]*/

highlight logErroDetected ctermfg=1
syntax match logErroDetected /Error detected\./

highlight logSignal ctermbg=1
syntax match logSignal /SIG[A-Z]\+/

let b:current_syntax = "log"
