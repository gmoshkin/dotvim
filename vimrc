"vimrc by gmoshkin

filetype off

""""""""""""""""""""""""""""""""""" PATHOGEN """""""""""""""""""""""""""""""""""
"{{{
"call pathogen#infect()
"Helptags
"}}}
"""""""""""""""""""""""""""""""""""" VUNDLE """"""""""""""""""""""""""""""""""""
"{{{
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
" Plugin 'jpalardy/vim-slime'
Plugin 'klen/python-mode'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'matchit.zip'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tommcdo/vim-exchange'

call vundle#end()
"}}}
"""""""""""""""""""""""""""""""""""" OPTIONS """""""""""""""""""""""""""""""""""
"{{{
syntax enable

filetype plugin indent on

if (!exists("b:foldmethod_set"))
    set foldmethod=syntax
endif

let g:c_space_errors = 1
"highlight ClosingSpace ctermbg=100
"match ClosingSpace /\s\+$/
"highlight space characters in the end of lines

"highlight OverLength cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#592929
"match OverLength /\%81v.\+/
"highlight text in 81+ columns

"highlight ColorColumn ctermbg=grey
"set colorcolumn=81
"highlight 81st column

set cursorline
"highlight the screen line of the cursor

set splitright
"opens new windows to the right from the old ones

set scrolloff=1
"number of screen lines to show around the cursor

set showbreak=~
"string to put before wrapped screen lines

set display=
"Include "lastline" to show the last line even if it doesn't fit
"Include "uhex" to show unprintable characters as a hex number

set tags=./tags,./TAGS,tags,TAGS,~/tags
"list of paths to search for tag files
"the last one is added by me

set expandtab
"replace tabs with spaces

set hidden
set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set hlsearch
set mouse=a
set colorcolumn=81

set laststatus=2
"always display status line

set incsearch
"Display the match for a search pattern when halfway typing it.

set showcmd
"Display an incomplete command in the lower right corner of the Vim window,
"left of the ruler.

if (&term != 'xterm' && &term != 'xterm-color')
    set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>
endif
set backspace=indent,eol,start
"This specifies where in Insert mode the <BS>> is allowed to delete the
"character in front of the cursor.  The threee items, separated by commas, tell
"Vim to delete the white space at the start oof the line, a line break and the
"character before where Insert mode started.
"}}}
"""""""""""""""""""""""""""""""""" KEY MAPS """"""""""""""""""""""""""""""""""""
"{{{
"noremap <F2> <ESC>:w<CR>
"noremap <F2> <ESC>[[{jyf)<C-O><C-O>:echo @0<CR>
noremap <F2> <ESC>:NERDTreeFind<CR>
"noremap <F3> <ESC>:tabnew<CR>
noremap <F3> <ESC>:NERDTreeToggle<CR>
"noremap <F4> <ESC>:e .<CR>
noremap <F4> <ESC>:TagbarToggle<CR>
noremap <F5> <ESC>:cprev<CR>
noremap <S-F5> <ESC>:lprev<CR>
noremap <F6> <ESC>:cnext<CR>
noremap <S-F6> <ESC>:lnext<CR>
noremap <F7> <ESC>:noh<CR>
noremap <S-F7> <ESC>/ $<CR>
noremap <F8> <ESC>:cfirst<CR>
noremap <S-F8> <ESC>:clast<CR>
noremap <F9> <ESC>:make!<CR>:copen<CR>
noremap <S-F9> <ESC>:make! clean<CR>
"noremap <C-F9> <ESC>yl:let @0 = GetPrevChar(@0)<CR>phx
noremap <C-F9> :<C-U>call PutPrevChar()<CR>ga
noremap <F10> <ESC>:echo GetSyntaxInfo()<CR>
"noremap <C-F10> <ESC>yl:let @0 = GetNextChar(@0)<CR>phx
noremap <C-F10> :<C-U>call PutNextChar()<CR>ga
noremap <F12> <ESC>:source $MYVIMRC<CR>

"noremap <C-N> <ESC>:tabnext<CR>
"noremap <C-P> <ESC>:tabprev<CR>
noremap <C-N> <ESC>:bnext<CR>
noremap <C-P> <ESC>:bprev<CR>
"noremap <C-P> <ESC>:bprev<CR>

noremap <C-S> <ESC>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>
"on ubuntu this one requires the following record in .bashrc file:
"stty -ixon

noremap <S-Left> @='3zh'<CR>
noremap <S-Right> @='3zl'<CR>
inoremap <S-Left> <C-O>3zh
inoremap <S-Right> <C-O>3zl

noremap <S-Up> <C-Y>
noremap <S-Down> <C-E>
inoremap <S-Up> <C-O><C-Y>
inoremap <S-Down> <C-O><C-E>

map <C-Up> [m
map <C-Down> ]m
vmap <C-Up> [m
vmap <C-Down> ]m
imap <C-Up> <C-O>[m
imap <C-Down> <C-O>]m

noremap <C-]> <ESC>:tjump <C-R><C-W><CR>

noremap <M-Left> <C-W><
noremap <M-Right> <C-W>>
noremap <M-Up> <C-W>+
noremap <M-Down> <C-W>-

noremap <Leader>y "+y
vnoremap <Leader>y "+y
noremap <Leader>Y "+Y
vnoremap <Leader>Y "+Y
noremap <Leader>p "+p
vnoremap <Leader>p "+p
noremap <Leader>P "+P
vnoremap <Leader>P "+P

noremap <Leader>o o<ESC>
noremap <Leader>O O<ESC>
noremap <Leader>V <ESC>ggVG

" noremap <C-H> <C-W>h
" noremap <C-J> <C-W>j
" noremap <C-K> <C-W>k
" noremap <C-L> <C-W>l

inoremap <C-B> <Left>
inoremap <C-F> <Right>

noremap ZA zA
noremap ZM zM
noremap ZR zR
noremap ZO zO
noremap ZC zC
noremap ZN zN

noremap Q ZQ
noremap ZB <ESC>:call DeleteBuffer()<CR>

noremap Y y$

noremap ; :
noremap : ;
"}}}
"""""""""""""""""""""""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""
"{{{
function! SetTabStop()
    " if search("    ", 'n')
        " setlocal noexpandtab
    " else
        let ts = CheckTabStop()
        if ts
            setlocal expandtab
            execute "setlocal tabstop=" . ts
            execute "setlocal shiftwidth=" . ts
        endif
    " endif
endfunction

function! CheckTabStop()
    for n in [2, 3, 4, 8]
        1
        "if search("^" . Spaces(n) . "\\S", 'n')
        if SearchSpacesOutOfComments(n)
            return n
        endif
    endfor
    return 0
endfunction

function! SearchSpacesOutOfComments(n)
    while search("^" . Spaces(a:n) . "\\S", 'W')
        if synIDattr(synID(line("."),col("."),0),"name") !=# "cComment"
            return 1
        endif
    endwhile
    return 0
endfunction

function! Spaces(n)
    if a:n == 1
        return " "
    else
        return " " . Spaces(a:n - 1)
    endif
endfunction

function! GetSyntaxInfo()
    "let id = synID(line("."), col("."), 0)
    let stack = synstack(line("."), col("."))
    "return join([synIDattr(id, "name"), synIDattr(id, "fg", "cterm"), synIDattr(id, "bg", "cterm")])
    return join(map(stack, "synIDattr(v:val, \"name\")"))
endfunction

function! GetNextChar(c)
    return nr2char(char2nr(a:c) + 1)
endfunction

function! GetPrevChar(c)
    return nr2char(char2nr(a:c) - 1)
endfunction

function! PutNextChar()
    let i = v:count1
    normal mu
    normal yl
    while i > 0
        execute 'normal r' . GetNextChar(@0)
        normal `u
        let i = i - 1
    endwhile
endfunction

function! PutPrevChar()
    let i = v:count1
    normal mu
    normal yl
    while i > 0
        execute 'normal r' . GetPrevChar(@0)
        normal `u
        let i = i - 1
    endwhile
endfunction

function! DeleteBuffer()
    let nerdtree_open = nerdtree#isTreeOpen()
    let tagbar_winnr = bufwinnr("__Tagbar__")
    if nerdtree_open
        NERDTreeClose
    endif
    if tagbar_winnr != -3
        call tagbar#CloseWindow()
    endif
    bdelete
    if nerdtree_open
        NERDTree
    endif
    if tagbar_winnr != -3
        call tagbar#OpenWindow()
    endif
endfunction
"}}}
"""""""""""""""""""""""""""""""" AUTOCOMMANDS """"""""""""""""""""""""""""""""""
"{{{

" Folds are open by default
augroup OpenFolds
    autocmd!
    autocmd BufRead * normal zR
augroup END

" OpenGL Shader Languauge
augroup GLSLFileType
    autocmd!
    autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440
    "autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl    setf glsl
augroup END

augroup VimrcFiletype
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker |
                       \ let b:foldmethod_set = 1
augroup END

augroup VimDefault
    autocmd!
    autocmd VimEnter * nested if argc() == 0 && bufname("%") == "" |
                            \     edit $MYVIMRC |
                            \ endif
    "autocmd VimEnter * PluginInstall
augroup END

augroup FiletypeTabs
    autocmd!
    autocmd BufNewFile,BufRead *.py set tabstop=4 | set expandtab
    autocmd BufNewFile,BufRead *.vim,*.c,*.cpp,*.glsl execute SetTabStop()
augroup END

augroup VimFoldmethod
    autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END

augroup SourceVimrc
    autocmd!
    autocmd FileWritePost,BufWritePost ~/.vim/vimrc,.vimrc source %
augroup END
"}}}
"""""""""""""""""""""""""""""""" PYTHON-MODE """""""""""""""""""""""""""""""""""
"{{{
let g:pymode_options_colorcolumn = 1
let g:pymode_folding_regex = '^\s*\%(class\|def\|for\|if\|while\) \w\+'
"}}}
"""""""""""""""""""""""""""""""""""" SLIME """""""""""""""""""""""""""""""""""""
"{{{
" let g:slime_target = "tmux"
" let g:slime_no_mappings = 1
" xnoremap <leader>s <Plug>SlimeRegionSend
" nnoremap <leader>s <Plug>SlimeMotionSend
" nnoremap <leader>ss <Plug>SlimeLineSend
"}}}
""""""""""""""""""""""""""""""""""" TAGBAR """""""""""""""""""""""""""""""""""""
"{{{
let g:tagbar_width = 30
"}}}
""""""""""""""""""""""""""""""""""" AIRLINE """"""""""""""""""""""""""""""""""""
"{{{
"let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
"let g:airline_left_sep='⟫'
"let g:airline_left_alt_sep='⟩'
"let g:airline_right_sep='⟪'
"let g:airline_right_alt_sep='⟨'

"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif

"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.readonly = '( •_•)>⌐■-■'"⌐⟥⟤'"😎
"}}}
"""""""""""""""""""""""""""""""""" SOLARIZED """""""""""""""""""""""""""""""""""
"{{{
if (&term != 'xterm' && &term != 'xterm-color')
    colorscheme solarized
    "let g:solarized_termcolors = 256
    "let g:solarized_contrast="low"
    set background=dark
endif
"}}}
""""""""""""""""""""""""""""""""" NERDCOMMENTER """"""""""""""""""""""""""""""""
"{{{
let g:NERDSpaceDelims = 1
"}}}
""""""""""""""""""""""""""""""""""""" CTRLP """"""""""""""""""""""""""""""""""""
"{{{
let g:ctrlp_map = '<CR>'
"}}}
""""""""""""""""""""""""""""""""" INDENT GUIDE """""""""""""""""""""""""""""""""
"{{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
augroup IndetGuideColor
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=242 ctermbg=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=242 ctermbg=0
augroup END
"}}}
""""""""""""""""""""""""""""""" MULTIPLE CURSORS """""""""""""""""""""""""""""""
"{{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-J>'
let g:multi_cursor_prev_key='<C-K>'
let g:multi_cursor_skip_key='<C-L>'
let g:multi_cursor_quit_key='<Esc>'
"}}}
