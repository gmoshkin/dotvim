" au BufNewFile,BufRead *.log if search('[a-z0-9_]\+_\d\+\s\+:\s\+\(ARRAY\s\+BITVECTOR(\d\+)\s\+OF\)\?\s\+BITVECTOR(\d\+).*;', 'n', 0, 10) | set filetype=trace | endif
