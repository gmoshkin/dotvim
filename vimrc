"vimrc by gmoshkin

if has("gui_win32")
    " set guifont=Meslo_LG_M_Regular_for_Powerline:h10:cANSI
    set guifont=Consolas:h10:cANSI
endif

filetype off

" check if python is really supported
let g:has_python = 1
try
    python 0
    " echomsg 'Python is supported'
catch
    " echomsg 'Python is not supported'
    let g:has_python = 0
endtry

""""""""""""""""""""""""""""""""""" PATHOGEN """""""""""""""""""""""""""""""""""
"{{{
"call pathogen#infect()
"Helptags
"}}}
"""""""""""""""""""""""""""""""""""" VUNDLE """"""""""""""""""""""""""""""""""""
"{{{
if has("win32")
    cd C:\Users\ion
    language English

    set runtimepath+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" Plugin 'AnsiEsc.vim'
" Plugin 'DrawIt'
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
if has("lua") && v:version > 703 && !has("win32")
    Plugin 'Shougo/neocomplete.vim'
endif
" Plugin 'Shougo/vimproc.vim'
if v:version > 703 && has("python") && g:has_python
    Plugin 'SirVer/ultisnips'
endif
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'benmills/vimux'
Plugin 'bufkill.vim'
Plugin 'calebsmith/vim-lambdify'
Plugin 'chrisbra/csv.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'duff/vim-scratch'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
" Plugin 'fatih/vim-go'
if v:version > 703
    Plugin 'honza/vim-snippets'
endif
Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'terryma/vim-expand-region'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
" Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

call vundle#end()
"}}}
"""""""""""""""""""""""""""""""""""" OPTIONS """""""""""""""""""""""""""""""""""
"{{{
filetype plugin indent on

if (!exists("b:foldmethod_set"))
    set foldmethod=syntax
endif

let g:c_space_errors = 1

set cursorline
"highlight the screen line of the cursor

set splitright
"opens new windows to the right from the old ones

set scrolloff=1
"number of screen lines to show around the cursor

set display=
"Include "lastline" to show the last line even if it doesn't fit
"Include "uhex" to show unprintable characters as a hex number

set tags=./tags,./TAGS,tags,TAGS,~/tags
"list of paths to search for tag files
"the last one is added by me

set hidden
"Allow hidden buffers

set number
"Line numbers

set autoread
"Automaticaly read buffer, when it's changed outside of vim and not changed
"in vim

set tabstop=4
set shiftwidth=4
set expandtab
" set autoindent
" set smartindent
"Indent stuff

set hlsearch
set mouse=a

set textwidth=80
set colorcolumn=+1
"
" let &colorcolumn = join(range(81,300), ',')
"Color columns from 81 to 300

set formatoptions-=t

set laststatus=2
"always display status line

set incsearch
"Display the match for a search pattern when halfway typing it.

set showcmd
"Display an incomplete command in the lower right corner of the Vim window,
"left of the ruler.

" set spell
"Spellcheck

set nowrap
"Do not wrap lines, that exceed screen width

set updatetime=250

if has("win32")
    set langmap=Èq,ˆw,Ûe,Ír,Ât,Ìy,„u,¯i,˘o,Áp,ı[,˙],Ùa,˚s,‚d,‡f,Ôg,h,Ój,Îk,‰l,Ê\\;,˝',ˇz,˜x,Òc,Ïv,Ëb,Ún,¸m,·\\,,˛.,…Q,÷W,”E, R,≈T,ÕY,√U,ÿI,ŸO,«P,’{,⁄},‘A,€S,¬D,¿F,œG,–H,ŒJ,ÀK,ƒL,∆\:,›\",ﬂZ,◊X,—C,ÃV,»B,“N,‹M,¡<,ﬁ>
else
    if (&term != 'xterm' && &term != 'xterm-color')
        set langmap=–πq,—Üw,—Ée,–∫r,–µt,–Ωy,–≥u,—ài,—âo,–∑p,—Ö[,—ä],—Ña,—ãs,–≤d,–∞f,–øg,—Äh,–æj,–ªk,–¥l,–∂\\;,—ç',—èz,—áx,—Åc,–ºv,–∏b,—Çn,—åm,–±\\,,—é.,–ôQ,–¶W,–£E,–öR,–ïT,–ùY,–ìU,–®I,–©O,–óP,–•{,–™},–§A,–´S,–íD,–êF,–üG,–†H,–ûJ,–õK,–îL,–ñ\:,–≠\",–ØZ,–ßX,–°C,–úV,–òB,–¢N,–¨M,–ë<,–Æ>
    endif
endif

if has("win32") || has("gui")
    set visualbell t_vb=
    "this stops the noisy beeping every time I press a button
endif

set backspace=indent,eol,start
"This specifies where in Insert mode the <BS>> is allowed to delete the
"character in front of the cursor.  The threee items, separated by commas, tell
"Vim to delete the white space at the start oof the line, a line break and the
"character before where Insert mode started.

" if &term =~ '^screen' && exists('$TMUX')
if exists('$TMUX') || exists('$SSH_CLIENT') || exists('$SSH_TTY')
    set t_ut=
    "fixes the problem with the terminal's background color "bleeding" into
    "Vim's http://sunaku.github.io/vim-256color-bce.html
    " set <F1>=[11;*~
    " set <F2>=[12;*~
    " set <F3>=[13;*~
    " set <F4>=[14;*~
    set <F5>=[15;*~
    set <F6>=[17;*~
    set <F7>=[18;*~
    set <F8>=[19;*~
    set <F9>=[20;*~
    set <F10>=[21;*~
    set <F11>=[23;*~
    set <F12>=[24;*~
    "allows to use modifiers (e.g. Shift, Ctrl) with these function keys
    set <xUp>=[1;*A
    set <xDown>=[1;*B
    set <xRight>=[1;*C
    set <xLeft>=[1;*D
endif
"}}}
"""""""""""""""""""""""""""""""""" KEY MAPS """"""""""""""""""""""""""""""""""""
"{{{
"noremap <F2> <ESC>:w<CR>
"noremap <F2> <ESC>[[{jyf)<C-O><C-O>:echo @0<CR>
" noremap <F2> <ESC>:NERDTreeFind<CR>
"noremap <F3> <ESC>:tabnew<CR>
" noremap <F3> <ESC>:NERDTreeToggle<CR>
"noremap <F4> <ESC>:e .<CR>
" noremap <F4> <ESC>:TagbarToggle<CR>
" noremap <F5> <ESC>:cprev<CR>
" noremap <S-F5> <ESC>:lprev<CR>
" noremap <F6> <ESC>:cnext<CR>
" noremap <S-F6> <ESC>:lnext<CR>
noremap <F7> <ESC>:noh<CR>
noremap <S-F7> <ESC>/ $<CR>
" noremap <F8> <ESC>:cfirst<CR>
" noremap <S-F8> <ESC>:clast<CR>
" noremap <F9> <ESC>:make!<CR>:copen<CR>
" noremap <S-F9> <ESC>:make! clean<CR>
"noremap <C-F9> <ESC>yl:let @0 = GetPrevChar(@0)<CR>phx
noremap <C-F9> :<C-U>call PutPrevChar()<CR>ga
noremap <F10> <ESC>:echo GetSyntaxInfo()<CR>
"noremap <C-F10> <ESC>yl:let @0 = GetNextChar(@0)<CR>phx
noremap <C-F10> :<C-U>call PutNextChar()<CR>ga
" noremap <F12> <ESC>:source $MYVIMRC<CR>

"noremap <C-N> <ESC>:tabnext<CR>
"noremap <C-P> <ESC>:tabprev<CR>
noremap <C-N> <ESC>:bnext<CR>
noremap <C-P> <ESC>:bprev<CR>

noremap <C-S> <ESC>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>
"on ubuntu this one requires the following record in .bashrc file:
"stty -ixon

noremap <silent> <S-Left> @='3zh'<CR>
noremap <silent> <S-Right> @='3zl'<CR>
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

noremap <Leader>V <ESC>ggVG

" noremap <Leader>g <ESC>:Ggrep <CR>
" vnoremap <Leader>g y<ESC>:Ggrep 0<CR>

noremap <Leader>w <ESC>:Gwrite<CR>

inoremap <C-B> <Left>
inoremap <C-F> <Right>

noremap ZA zA
noremap ZM zM
noremap ZR zR
noremap ZO zO
noremap ZC zC
noremap ZN zN

noremap Q ZQ
noremap ZB <ESC>:BD<CR>

noremap Y y$

noremap ; :
noremap : ;

map <Space> <Plug>(easymotion-prefix)
" map f <Plug>(easymotion-f)
" map F <Plug>(easymotion-F)

noremap gA <ESC>:echo GetSyntaxInfo()<CR>

vnoremap / y<ESC>/0
vnoremap <CR> y<ESC>/0<CR>

cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-Z> <S-Left>
cnoremap <C-F> <Right>
cnoremap <C-X> <S-Right>
cnoremap <C-G> <C-F>
cnoremap <C-D> <Del>

noremap <Leader>b <Esc>:BuffergatorOpen<CR>
noremap <Leader>B <Esc>:BuffergatorClose<CR>
noremap [b <Esc>:BuffergatorMruCyclePrev<CR>
noremap ]b <Esc>:BuffergatorMruCycleNext<CR>

noremap <Leader>t <Esc>:call TabularizeChar()<CR>
noremap <Leader>T <Esc>:Tabularize<CR>

noremap <Leader>to <Esc>:TagbarOpen<CR>
noremap <Leader>tc <Esc>:TagbarClose<CR>
noremap <Leader>tj <Esc>:TagbarOpen -j<CR>
noremap <Leader>tO <Esc>:TagbarOpenAutoClose<CR>

noremap <Leader>no <Esc>:NERDTree<CR>
noremap <Leader>nt <Esc>:NERDTreeToggle<CR>
noremap <Leader>nc <Esc>:NERDTreeClose<CR>
noremap <Leader>nf <Esc>:NERDTreeFind<CR>
noremap <Leader>nj <Esc>:NERDTreeFocus<CR>

noremap <Leader>( <ESC>:call FoldArgumentsOntoMultipleLines()<CR>

noremap <Leader>qo <ESC>:belowright copen<CR>
noremap <Leader>qc <ESC>:belowright cclose<CR>

noremap cog <ESC>:IndentGuidesToggle<CR>

noremap cof <ESC>:call ToggleAutoFormat()<CR>

noremap coa <ESC>:call ToggleColorColumn()<CR>

noremap cop <ESC>:set paste!<CR>

map c<space> <plug>NERDCommenterToggle

noremap <C-Space> <ESC>:CtrlPBuffer<CR>
"}}}
"""""""""""""""""""""""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""
"{{{
function! ToggleAutoFormat()
    if !exists('b:auto_format_enabled')
        let b:auto_format_enabled = 0
    endif
    if b:auto_format_enabled
        setlocal formatoptions-=a
        echo 'autoformat disabled'
    else
        setlocal formatoptions+=a
        echo 'autoformat enabled'
    endif
    let b:auto_format_enabled = !b:auto_format_enabled
endfunction

function! ToggleColorColumn()
    if !exists('b:colorcolumn_enabled')
        let b:colorcolumn_enabled = 1
    endif
    if b:colorcolumn_enabled
        setlocal colorcolumn=
        echo 'colorcolumn disabled'
    else
        setlocal colorcolumn=+1
        echo 'colorcolumn enabled'
    endif
    let b:colorcolumn_enabled = !b:colorcolumn_enabled
endfunction

""" Obsolette due to vim-slueth usage
" function! SetTabStop()
    " " if search("    ", 'n')
        " " setlocal noexpandtab
    " " else
        " let ts = CheckTabStop()
        " if ts
            " setlocal expandtab
            " execute "setlocal tabstop=" . ts
            " execute "setlocal shiftwidth=" . ts
        " else
            " setlocal noexpandtab
        " endif
    " " endif
" endfunction

" function! CheckTabStop()
    " for n in [2, 3, 4, 8]
        " 1
        " "if search("^" . Spaces(n) . "\\S", 'n')
        " if SearchSpacesOutOfComments(n)
            " return n
        " endif
    " endfor
    " return 0
" endfunction

" function! SearchSpacesOutOfComments(n)
    " while search("^" . Spaces(a:n) . "\\S", 'W')
        " if synIDattr(synID(line("."),col("."),0),"name") !=# "cComment"
            " return 1
        " endif
    " endwhile
    " return 0
" endfunction

" function! Spaces(n)
    " if a:n == 1
        " return " "
    " else
        " return " " . Spaces(a:n - 1)
    " endif
" endfunction

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

function! SetLaTeXKeyMappings()
    noremap <buffer> <Leader>mp <ESC>:!pdflatex %:p<CR>
    noremap <buffer> <Leader>mb
            \ <ESC>:execute '!bibtex '.split(expand('%:p'), '\.')[0].'.aux'<CR>
    " noremap <buffer> <C-S> <ESC>:update<CR>:!pdflatex %:p<CR>
    " inoremap <buffer> <C-S> <C-O>:update<CR><C-O>:!pdflatex %:p<CR>
    " vnoremap <buffer> <C-S> <C-C>:update<CR>:!pdflatex %:p<CR>
endfunction

function! SetMakeKeyMappings()
    noremap <buffer> <Leader>mm <ESC>:make!<CR>:clist<CR>
    noremap <buffer> <Leader>mi <ESC>:make! install<CR>
    noremap <buffer> <Leader>mc <ESC>:make! clean<CR>
    noremap <buffer> <Leader>md <ESC>:make! depend<CR>
    noremap <buffer> <Leader>M <ESC>:make!<CR>:make! install<CR>
endfunction

function! SetIndentGuideColors()
    hi indentguidesodd  ctermfg=12 ctermbg=0
    hi indentguideseven ctermfg=12 ctermbg=23
endfunction

function! Crutch()
    AirlineRefresh
    " Fix color mixup after resourcing vimrc
    call SetIndentGuideColors()
    " Fix indent guides disapearing after resourcing vimrc
endfunction

" Function called before entering multiple cursors' mode
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Function called after leaving multiple cursors' mode
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
    set cursorline
endfunction

function! FoldArgumentsOntoMultipleLines()
    substitute@,\s*@,\r@ge
    normal v``="
endfunction

function! TabularizeChar()
    let c = getchar()
    execute 'Tabularize/'.nr2char(c)
endfunction

function! SetVimDir()
    for f in split(&runtimepath, ',')
        if f =~ '.*/vimfiles$' && !exists('g:myVimDir')
            let g:myVimDir = f
        endif
        if f =~ '.*/\.vim$'
            let g:myVimDir = f
        endif
    endfor
endfunction

function! GoToError(errorNumber)
    execute 'cc '.a:errorNumber
endfunction
"}}}
"""""""""""""""""""""""""""""""" AUTOCOMMANDS """"""""""""""""""""""""""""""""""
"{{{

" augroup Text
    " autocmd!
    " autocmd FileType text setlocal spell
" augroup END

" Folds are open by default
augroup OpenFolds
    autocmd!
    autocmd BufRead * normal zR
augroup END

" OpenGL Shader Languauge
" FIXME move to ftdetect
augroup GLSLFileType
    autocmd!
    autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440
    "autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl    setf glsl
augroup END

" FIXME move to ftplugin
augroup Foldmethod
    autocmd!
    autocmd Filetype vim,scheme setlocal foldmethod=marker |
                              \ let b:foldmethod_set = 1
augroup END

" augroup VimDefault
    " autocmd!
    " autocmd VimEnter * nested if argc() == 0 && bufname("%") == "" |
                            " \     edit $MYVIMRC |
                            " \ endif
    " "autocmd VimEnter * PluginInstall
" augroup END

" augroup FiletypeTabs
    " autocmd!
    " autocmd BufNewFile,BufRead *.py setlocal ts=4 | setlocal sw=4 | setlocal expandtab
    " autocmd BufNewFile,BufRead *.rkt setlocal ts=2 | setlocal sw=2 | setlocal expandtab
    " autocmd BufNewFile,BufRead *.vim,*.c,*.cpp,*.glsl execute SetTabStop()
" augroup END

" FIXME move to ftplugin
augroup RacketRun
    autocmd!
    autocmd FileType scheme noremap <buffer> <Leader>r <ESC>:!racket %:p<CR>
augroup END

" FIXME move to ftplugin
augroup LaTeXMake
    autocmd!
    autocmd FileType tex call SetLaTeXKeyMappings()
augroup END

" FIXME move to ftplugin
augroup Make
    autocmd!
    autocmd FileType c,cpp call SetMakeKeyMappings()
augroup END

" FIXME move to ftplugin
augroup VimHelp
    autocmd!
    autocmd FileType help noremap <buffer> <CR> <ESC><C-]>
augroup END

" FIXME move to ftplugin
augroup NERDTreeIndentGuide
    autocmd!
    " this one is which you're most likely to use?
    autocmd FileType nerdtree setlocal ts=2 | setlocal sw=2
augroup end

augroup CSVIndentGuide
    autocmd!
    autocmd BufEnter *.csv IndentGuidesDisable
    autocmd BufLeave *.csv IndentGuidesEnable
augroup END

augroup QuickFix
    autocmd!
    autocmd FileType qf noremap <buffer> <silent> <CR> <ESC>:call GoToError(line('.'))<CR>
augroup END
"}}}
"""""""""""""""""""""""""""""""" PYTHON-MODE """""""""""""""""""""""""""""""""""
"{{{
let g:pymode_options_colorcolumn = 1
let g:pymode_doc = 0
let g:pymode_folding_regex = '^\s*\%(class\|def\|for\|if\|while\) \w\+'
let g:pymode_rope = 0
let g:pymode_lint_options_pep8 = {
    \ 'max_line_length': 80,
    \ 'ignore': 'E104'
    \ }
"}}}
"""""""""""""""""""""""""""""""""""" SLIME """""""""""""""""""""""""""""""""""""
"{{{
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap <Leader>s <Plug>SlimeRegionSend
nmap <Leader>s <Plug>SlimeMotionSend
nmap <Leader>ss <Plug>SlimeLineSend
"}}}
""""""""""""""""""""""""""""""""""" TAGBAR """""""""""""""""""""""""""""""""""""
"{{{
let g:tagbar_width = 30
"}}}
""""""""""""""""""""""""""""""""""" AIRLINE """"""""""""""""""""""""""""""""""""
"{{{
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#csv#column_display = 'Name'
if !has("win32")
    let g:airline_powerline_fonts = 1
endif

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
"let g:airline_left_sep='‚ü´'
"let g:airline_left_alt_sep='‚ü©'
"let g:airline_right_sep='‚ü™'
"let g:airline_right_alt_sep='‚ü®'

"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif

"let g:airline_symbols.branch = '‚éá'
"let g:airline_symbols.linenr = '¬∂'
"let g:airline_symbols.paste = 'œÅ'
"let g:airline_symbols.whitespace = 'Œû'
"let g:airline_symbols.readonly = '( ‚Ä¢_‚Ä¢)>‚åê‚ñ†-‚ñ†'"‚åê‚ü•‚ü§'"üòé

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
""""""""""""""""""""""""""""""""""" NERDTREE """""""""""""""""""""""""""""""""""
"{{{
let NERDTreeAutoDeleteBuffer=1
"}}}
""""""""""""""""""""""""""""""""""""" CTRLP """"""""""""""""""""""""""""""""""""
"{{{
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_map = '<CR>'
"}}}
""""""""""""""""""""""""""""""""" INDENT GUIDE """""""""""""""""""""""""""""""""
"{{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
augroup IndetGuideColor
    autocmd!
    autocmd VimEnter,Colorscheme * :call SetIndentGuideColors()
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
""""""""""""""""""""""""""""""""" NEOCOMPLETE """"""""""""""""""""""""""""""""""
"{{{
let g:neocomplete#enable_at_startup = 1
"}}}
""""""""""""""""""""""""""""""""" DELIMITMATE """"""""""""""""""""""""""""""""""
"{{{
au FileType scheme let b:delimitMate_quotes = "\""
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
"}}}
"""""""""""""""""""""""""""""""""" JEDI-VIM """"""""""""""""""""""""""""""""""""
"{{{
let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures=2
let g:jedi#use_tabs_not_buffers=0
" this is a crtoch for the cursor not going to end of line in insert mode bug
if version < 704 && g:jedi#show_call_signatures != 1
    autocmd! InsertEnter
endif
"}}}
"""""""""""""""""""""""""""""""""" LATEX-BOX """""""""""""""""""""""""""""""""""
"{{{
let g:LatexBox_quickfix = 4
let g:LatexBox_show_warnings = 0
if len(serverlist())
    let g:LatexBox_latexmk_async = 1
    let g:LatexBox_latexmk_preview_continuously = 1
endif
"}}}
"""""""""""""""""""""""""""""""""""" VIM-GO """"""""""""""""""""""""""""""""""""
"{{{
let g:go_fmt_autosave = 0
let g:go_fmt_options = join([
            \ '-tabs=' . (&expandtab ? 'false' : 'true'),
            \ '-tabwidth=' . &tabstop
            \])
"}}}
""""""""""""""""""""""""""""""""""" GITGUTTER """"""""""""""""""""""""""""""""""
"{{{
" Doesn't work :(
" noremap gs <Plug>GitGutterPreviewHunk
"}}}
"""""""""""""""""""""""""""""""""" AUTOUPDATE """"""""""""""""""""""""""""""""""
"{{{
if has("python") && g:has_python
    call SetVimDir()
python << END
import vim
import datetime

updateLog = vim.eval("g:myVimDir") + '/last_plugin_update'
try:
    with open(updateLog, 'r') as f:
        date = datetime.datetime.strptime(f.readline(), '%Y %m %d\n')
except IOError:
    date = None
today = datetime.datetime.now()
if not date or (today - date).days > 6:
    vim.command('PluginUpdate')
    with open(updateLog, 'w') as f:
        print >> f, datetime.datetime.strftime(today, '%Y %m %d')
END
endif
"}}}
""""""""""""""""""""""""""""""""" BUFFERGATOR """"""""""""""""""""""""""""""""""
"{{{
let g:buffergator_suppress_keymaps = 1
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
