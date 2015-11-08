au BufNewFile,BufRead *grind setf log
au BufNewFile,BufRead *.log if search('[a-z0-9_]\+_\d\+\s\+:\s\+\(ARRAY\s\+BITVECTOR(\d\+)\s\+OF\)\?\s\+BITVECTOR(\d\+).*;', 'n', 0, 10) | setf trace | else | setf log | endif
