" switching between buffers
noremap <C-N> <ESC>:bnext<CR>
noremap <C-P> <ESC>:bprev<CR>

"on ubuntu this one requires the following entry in .bashrc file:
"stty -ixon
noremap <C-S> :<C-U>update<CR>

" turn the search highlighting off
nnoremap <C-@> :<C-U>nohlsearch<CR>

" move screen horizontally in descent increments with shift + arrow keys
noremap <silent> <S-Left> @='3zh'<CR>
noremap <silent> <S-Right> @='3zl'<CR>

" move screen vertically with shift + arrow keys
noremap <S-Up> <C-Y>
noremap <S-Down> <C-E>

" when jumping to the tag prompt for selection if there are several matches
noremap <C-]> <ESC>:tjump <C-R><C-W><CR>

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
noremap <leader>p gp
noremap <leader>P gP

vnoremap <leader>p gp
vnoremap <leader>P gP

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

" very magical searching with alt + / and alt + ?
nnoremap <ESC>/ /\v
nnoremap <ESC>? ?\v

" open a man page for the word under cursor with the Man command if it exists
if exists(':Man')
    noremap K <ESC>:Man <C-R><C-W><CR>
endif

" open current directory
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
