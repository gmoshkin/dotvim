if exists('$TMUX') || exists('$SSH_CLIENT') || exists('$SSH_TTY')
    set <F2>=OQ
    set <S-F2>=[1;2Q
    " set <xF2>=[1;5Q
    set <F3>=OR
    set <S-F3>=[1;2R
    " set <xF3>=[1;5R
    set <F4>=OS
    set <S-F4>=[1;2S
    " set <xF4>=[1;5S
    set <F5>=[15;*~
    set <F6>=[17;*~
    set <F7>=[18;*~
    set <F8>=[19;*~
    set <F9>=[20;*~
    set <F10>=[21;*~
    set <F11>=[23;*~
    set <F12>=[24;*~
endif

noremap <silent> <F2> :<C-U>echo 'F2 is not assigned'<CR>
noremap <silent> <S-F2> :<C-U>echo 'S-F2 is not assigned'<CR>
" noremap <silent> <xF2> :<C-U>echo 'C-F2 is not assigned'<CR>
noremap <silent> <F3> :<C-U>echo 'F3 is not assigned'<CR>
noremap <silent> <S-F3> :<C-U>echo 'S-F3 is not assigned'<CR>
" noremap <silent> <xF3> :<C-U>echo 'C-F3 is not assigned'<CR>
noremap <silent> <F4> :<C-U>echo 'F4 is not assigned'<CR>
noremap <silent> <S-F4> :<C-U>echo 'S-F4 is not assigned'<CR>
" noremap <silent> <xF4> :<C-U>echo 'C-F4 is not assigned'<CR>
noremap <silent> <F5> :<C-U>echo 'F5 is not assigned'<CR>
noremap <silent> <S-F5> :<C-U>echo 'S-F5 is not assigned'<CR>
noremap <silent> <C-F5> :<C-U>echo 'C-F5 is not assigned'<CR>
noremap <silent> <F6> :<C-U>echo 'F6 is not assigned'<CR>
noremap <silent> <S-F6> :<C-U>echo 'S-F6 is not assigned'<CR>
noremap <silent> <C-F6> :<C-U>echo 'C-F6 is not assigned'<CR>
noremap <silent> <F7> :<C-U>echo 'F7 is not assigned'<CR>
noremap <silent> <C-F7> :<C-U>echo 'C-F7 is not assigned'<CR>
noremap <silent> <F8> :<C-U>echo 'F8 is not assigned'<CR>
noremap <silent> <S-F8> :<C-U>echo 'S-F8 is not assigned'<CR>
noremap <silent> <C-F8> :<C-U>echo 'C-F8 is not assigned'<CR>
noremap <silent> <F9> :<C-U>echo 'F9 is not assigned'<CR>
noremap <silent> <S-F9> :<C-U>echo 'S-F9 is not assigned'<CR>
noremap <silent> <S-F10> :<C-U>echo 'S-F10 is not assigned'<CR>
noremap <silent> <S-F11> :<C-U>echo 'S-F11 is not assigned'<CR>
noremap <silent> <C-F11> :<C-U>echo 'C-F11 is not assigned'<CR>
noremap <silent> <S-F12> :<C-U>echo 'S-F12 is not assigned'<CR>
noremap <silent> <C-F12> :<C-U>echo 'C-F12 is not assigned'<CR>
noremap <silent> <F12> :<C-U>echo 'F12 is not assigned'<CR>

noremap <S-F7> <ESC>/\s\+$<CR>
noremap <C-F9> :<C-U>call misc#put_prev_char()<CR>ga
noremap <C-F10> :<C-U>call misc#put_next_char()<CR>ga

noremap <F10> <ESC>:echo misc#get_syntax_info()<CR>
