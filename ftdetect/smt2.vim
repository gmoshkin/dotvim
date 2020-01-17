au BufNewFile,BufRead * if search('^(declare-fun.*)$', 'n', 0, 10) | set filetype=smt2 | endif
