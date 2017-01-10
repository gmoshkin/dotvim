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
Plugin 'Shougo/unite.vim'
if v:version > 703 && has("python") && g:has_python
    Plugin 'SirVer/ultisnips'
endif
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'bronson/vim-visual-star-search'
" Plugin 'benmills/vimux'
Plugin 'calebsmith/vim-lambdify'
Plugin 'chrisbra/csv.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'devjoe/vim-codequery'
Plugin 'duff/vim-scratch'
Plugin 'gmarik/Vundle.vim'
Plugin 'gmoshkin/bufkill.vim'
Plugin 'gmoshkin/vim-kw'
Plugin 'godlygeek/tabular'
Plugin 'fatih/vim-go'
if v:version > 703
    Plugin 'honza/vim-snippets'
endif
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-utils/vim-man'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-user'
if has("python") && g:has_python
    Plugin 'klen/python-mode'
endif
Plugin 'libclang-vim/libclang-vim'
Plugin 'libclang-vim/vim-textobj-function-clang'
Plugin 'libclang-vim/vim-textobj-clang'
Plugin 'luochen1990/rainbow'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'Konfekt/FastFold'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-syntastic/syntastic'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'terryma/vim-expand-region'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
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

packadd! matchit

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

"Line numbers
set number
set norelativenumber


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

set spelllang=ru_yo,en_us
" set spell
"Spellcheck

set nowrap
"Do not wrap lines, that exceed screen width

set updatetime=250

" Show a menu of alternatives when completing with <TAB> in the cmd line
set wildmenu

" Disable the annoying as fuck preview window when using omni-complete
set completeopt-=preview

" Trying out this thing
set ignorecase
set smartcase

set virtualedit+=block

let g:tex_flavor = 'tex'

if has("win32")
    set langmap=�q,�w,�e,�r,�t,�y,�u,�i,�o,�p,�[,�],�a,�s,�d,�f,�g,�h,�j,�k,�l,�\\;,�',�z,�x,�c,�v,�b,�n,�m,�\\,,�.,�Q,�W,�E,�R,�T,�Y,�U,�I,�O,�P,�{,�},�A,�S,�D,�F,�G,�H,�J,�K,�L,�\:,�\",�Z,�X,�C,�V,�B,�N,�M,�<,�>
else
    if (&term != 'xterm' && &term != 'xterm-color')
        set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>
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
    "fixes the problem with the terminal's background color "bleeding" into
    "Vim's http://sunaku.github.io/vim-256color-bce.html
    set t_ut=

    "allows to use modifiers (e.g. Shift, Ctrl) with these function keys
    set <xUp>=[1;*A
    set <xDown>=[1;*B
    set <xRight>=[1;*C
    set <xLeft>=[1;*D
endif
"}}}
"""""""""""""""""""""""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""
"{{{
function! SetIndentGuideColors()
    hi indentguidesodd  ctermfg=12 ctermbg=0
    hi indentguideseven ctermfg=12 ctermbg=23
endfunction

" Function called before entering multiple cursors' mode
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        execute 'NeoCompleteLock'
    endif
    let g:in_multi_cursor_mode = 1
endfunction

" Function called after leaving multiple cursors' mode
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock') == 2
        execute 'NeoCompleteUnlock'
    endif
    set cursorline
    let g:in_multi_cursor_mode = 0
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

function! GetRainbowColors()
    if !exists('b:rainbow_conf')
        RainbowToggleOn
        RainbowToggleOff
    endif
    let colors = b:rainbow_conf.ctermfgs
    echo colors
endfunction

function! SetRainbowColor(n, color)
    if !exists('b:rainbow_conf')
        RainbowToggleOn
        RainbowToggleOff
    endif
    if a:n < 0 || a:n > 3
        return
    endif
    let b:rainbow_conf.ctermfgs[a:n] = a:color
    echo 'set '.a:n.' color to "'.a:color.'"'
endfunction

function! SetRainbowColors()
    call SetRainbowColor(0, '1')
    call SetRainbowColor(1, '6')
    call SetRainbowColor(2, '5')
    call SetRainbowColor(3, '4')
endfunction

function! CodeQueryJump(...)
    if a:0 > 0
        execute "CodeQuery ".a:1
        cclose
    endif
    let qflist = getqflist()
    if len(qflist) == 0
        echo "No match"
    elseif len(qflist) == 1
        cc 1
    else
        belowright copen
    endif
endfunction
"}}}
"""""""""""""""""""""""""""""""" AUTOCOMMANDS """"""""""""""""""""""""""""""""""
"{{{

" Folds are open by default
augroup OpenFolds
    autocmd!
    autocmd BufEnter * normal zR
augroup END
"}}}
"""""""""""""""""""""""""""""""""" COMMANDS """"""""""""""""""""""""""""""""""""
"{{{
"}}}
"""""""""""""""""""""""""""""""""" KEY MAPS """"""""""""""""""""""""""""""""""""
"{{{
vnoremap <leader>gp y:<C-U>call windows#go_to_window()<BAR>call spot#select_positions('', @")<CR>
nnoremap <leader>gp yi(:<C-U>call windows#go_to_window()<BAR>call spot#select_positions('', @")<CR>
"}}}
"""""""""""""""""""""""""""""""" PYTHON-MODE """""""""""""""""""""""""""""""""""
"{{{
let g:pymode_options_colorcolumn = 1
let g:pymode_doc = 1
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
"}}}
""""""""""""""""""""""""""""""""""" TAGBAR """""""""""""""""""""""""""""""""""""
"{{{
let g:tagbar_width = 30
"}}}
""""""""""""""""""""""""""""""""""" AIRLINE """"""""""""""""""""""""""""""""""""
"{{{
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
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

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 100,
    \ 'x': 90,
    \ 'y': 120,
    \ 'z': 80,
    \ 'warning': 100,
    \ 'error': 80,
    \ }
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
let g:ctrlp_map = ''
"}}}
""""""""""""""""""""""""""""""""" INDENT GUIDE """""""""""""""""""""""""""""""""
"{{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'neoman', 'csv', 'man']
augroup IndetGuideColor
    autocmd!
    autocmd VimEnter,Colorscheme * :call SetIndentGuideColors()
augroup END
"}}}
""""""""""""""""""""""""""""""" MULTIPLE CURSORS """""""""""""""""""""""""""""""
"{{{
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-J>'
let g:multi_cursor_prev_key = '<C-K>'
let g:multi_cursor_skip_key = '<C-L>'
let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 0
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
""""""""""""""""""""""""""""""""" BUFFERGATOR """"""""""""""""""""""""""""""""""
"{{{
let g:buffergator_suppress_keymaps = 1
"}}}

""""""""""""""""""""""""""""""""""" BUFFKILL """""""""""""""""""""""""""""""""""
"{{{
let g:BufKillKeyMappings = 0
let g:BufKillBdKey = 'ZB'
"}}}
""""""""""""""""""""""""""""""""""" RAINBOW """"""""""""""""""""""""""""""""""""
"{{{
let g:rainbow_active = 0
"}}}
"""""""""""""""""""""""""""""""""" CODEQUERY """""""""""""""""""""""""""""""""""
"{{{
let g:codequery_trigger_build_db_when_db_not_found = 0
"}}}
""""""""""""""""""""""""""" VIM-TRAILING-WHITESPACE """"""""""""""""""""""""""""
"{{{
let g:extra_whitespace_ignored_filetypes = ['help', 'man', 'csv']
"}}}
""""""""""""""""""""""""""""""""""" KLOCWORK """""""""""""""""""""""""""""""""""
"{{{
let g:kw_settings = {
    \ "host": "localhost",
    \ "port": 9090,
    \ "user": "gmoshkin",
    \ "project": "cudafy",
    \ }
let g:kw_comments = {
    \ "Fix": "TP",
    \ "Not a problem": "FP",
    \ }

augroup KWVim
    autocmd BufWritePost kw.vim source %
augroup END
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
