function! s:shift_right_operator_func(type)
    call gshift#shift_lines(line("'["), line("']"), 1)
endfunction

function! s:shift_left_operator_func(type)
    call gshift#shift_lines(line("'["), line("']"), -1)
endfunction

function! s:shift_right2_operator_func(type)
    call gshift#shift_lines(line("'["), line("']"), 2)
endfunction

function! s:shift_left2_operator_func(type)
    call gshift#shift_lines(line("'["), line("']"), -2)
endfunction

nnoremap <silent> g> :<C-U>set operatorfunc=<SID>shift_right_operator_func<CR>g@
nnoremap <silent> g>> :<C-U>set operatorfunc=<SID>shift_right_operator_func<BAR>:execute 'normal '.v:count1.'g@_'<CR>
nnoremap <silent> g< :<C-U>set operatorfunc=<SID>shift_left_operator_func<CR>g@
nnoremap <silent> g<< :<C-U>set operatorfunc=<SID>shift_left_operator_func<BAR>:execute 'normal '.v:count1.'g@_'<CR>

vnoremap <silent> g> :<C-U>call gshift#shift_lines(line("'<"), line("'>"), 1)<CR>
vnoremap <silent> g< :<C-U>call gshift#shift_lines(line("'<"), line("'>"), -1)<CR>

" TODO: think of a better way to do this
nnoremap <silent> g2> :<C-U>set operatorfunc=<SID>shift_right2_operator_func<CR>g@
nnoremap <silent> g2>> :<C-U>set operatorfunc=<SID>shift_right2_operator_func<BAR>:execute 'normal '.v:count1.'g@_'<CR>
nnoremap <silent> g2< :<C-U>set operatorfunc=<SID>shift_left2_operator_func<CR>g@
nnoremap <silent> g2<< :<C-U>set operatorfunc=<SID>shift_left2_operator_func<BAR>:execute 'normal '.v:count1.'g@_'<CR>

vnoremap <silent> g2> :<C-U>call gshift#shift_lines(line("'<"), line("'>"), 2)<CR>
vnoremap <silent> g2< :<C-U>call gshift#shift_lines(line("'<"), line("'>"), -2)<CR>
