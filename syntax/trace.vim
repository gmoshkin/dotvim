if exists("b:current_syntax")
  finish
endif

highlight link traceMemory traceSpecial1
syntax match traceMemory /memory_\d\+/

highlight link traceRegisters traceSpecial2
syntax match traceRegisters /registers_\d\+/

highlight link traceTmp traceSpecial3
syntax match traceTmp /t_\d[0-9a-z]*_\d\+_\d\+/

highlight link traceFile traceSpecial4
syntax match traceFile /file_[a-zA-Z0-9_]\+/

highlight link traceOperator Operator
syntax keyword traceOperator OF WITH ASSERT QUERY
syntax match traceOperator /=/
syntax match traceOperator /:=/
syntax match traceOperator /:/
syntax match traceOperator /@/

highlight link traceBoolean Boolean
syntax keyword traceBoolean TRUE FALSE

highlight link traceType Type
syntax keyword traceType ARRAY BITVECTOR

highlight link traceConditional Conditional
syntax keyword traceConditional IF THEN ELSE ENDIF
let b:current_syntax = "trace"

highlight link traceNumber Number
syntax match traceNumber /\(0bin\|0hex\)\?\d[a-z0-9]*/

highlight link traceSpecial1 Identifier
highlight link traceSpecial2 Identifier
highlight link traceSpecial3 Identifier
highlight link traceSpecial4 Identifier

let b:current_syntax = "log"
