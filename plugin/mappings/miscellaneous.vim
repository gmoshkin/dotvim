" switching between buffers
noremap <C-N> <ESC>:bnext<CR>
noremap <C-P> <ESC>:bprev<CR>

"on ubuntu this one requires the following entry in .bashrc file:
"stty -ixon
noremap <C-S> :<C-U>update<CR>

" turn the search highlighting off (this is Ctrl+Space btw)
nnoremap <C-@> :<C-U>nohlsearch<CR>
nnoremap <C-Space> :<C-U>nohlsearch<CR>

" map Ctrl+Space to Esc. what else needs to be said?
vnoremap <C-@> <ESC>
vnoremap <C-Space> <ESC>

" move screen horizontally in descent increments with shift + arrow keys
noremap <silent> <S-Left> @='3zh'<CR>
noremap <silent> <S-Right> @='3zl'<CR>

" move screen vertically with shift + arrow keys
noremap <S-Up> <C-Y>
noremap <S-Down> <C-E>

" when jumping to the tag prompt for selection if there are several matches
nnoremap <silent> <C-]> :<C-U>call utils#save_option_do("ignorecase", "tjump ".expand("<cword>"))<CR>

" resize current window with alt + arrow keys
noremap <M-Left> <C-W><
noremap <M-Right> <C-W>>
noremap <M-Up> <C-W>+
noremap <M-Down> <C-W>-

" resize current window with alt + keys that are easier to reach
noremap <ESC>< <C-W><
noremap <ESC>> <C-W>>
noremap <ESC>+ <C-W>+
noremap <ESC>- <C-W>-

" system clipboard copy/paste mappings
nnoremap gy "+y
nnoremap gY "+Y

nnoremap gp "+p
nmap ]gp "+]p

nnoremap gP "+P
nmap ]gP "+]P

vnoremap gy "+y
vnoremap gY "+Y

vnoremap gp "+p
vnoremap gP "+P

" remap the origianl gp and gP commands to <leader>p/P
" actually, who needs them?
" noremap <leader>p gp
" noremap <leader>P gP

" vnoremap <leader>p gp
" vnoremap <leader>P gP

" visually select the whole file
noremap <leader>V <ESC>ggVG

" map Q to close the current window. will quit vim without saving if there's a
" single window. looks dangerous but I've used this for a couple of years
" probably and not even once accidentally lost my changes so..
noremap Q ZQ

" make Y behave consistently with D and C
nnoremap Y y$

" this one saves a like a billion years worth of time spent on pressing shift
noremap ; :
noremap : ;

" case (in)sensitive searching with ctrl + / and ctrl + ?
if &ignorecase == 1
    nnoremap <C-_> /\C
    nnoremap <C-?> ?\C
else
    nnoremap <C-_> /\c
    nnoremap <C-?> ?\c
endif

" * and # should always search case sensitive
if &ignorecase == 1
    nnoremap * /\C\<<C-R><C-W>\><CR>
    nnoremap # ?\C\<<C-R><C-W>\><CR>
endif

" very magical searching with alt + / and alt + ?
nnoremap <ESC>/ /\v
nnoremap <ESC>? ?\v

" open current directory
nnoremap <silent> - :silent edit <C-R>=empty(misc#curr_file()) ? '.' : misc#curr_dir()<CR><bar>set bufhidden=wipe<CR>

" jump to next search match and center screen
nnoremap <ESC>n nzz
nnoremap <ESC>N Nzz

" search within visual selection
vnoremap gv <ESC>/\%V
vnoremap gV V<ESC>/\%V

" open a split but select the opposite window
nnoremap <C-W>S <C-W>s<C-W>j
nnoremap <C-W>V <C-W>v<C-W>h

nnoremap <leader>pc :<C-U>pclose<CR>
