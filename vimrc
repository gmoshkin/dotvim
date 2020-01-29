"TODO:  write a plugin for compiling a single file and running the program in
"       the tmux pane

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

" check if we're a raspberrypi
" XXX: maybe there's a better way of doing this?
let g:its_a_pi = system("hostname") =~ "raspberrypi" ? 1 : 0

""""""""""""""""""""""""""""""""""" PATHOGEN """""""""""""""""""""""""""""""""""
"{{{
"call pathogen#infect()
"Helptags
"}}}
"""""""""""""""""""""""""""""""""""" VUNDLE """"""""""""""""""""""""""""""""""""
"{{{
if has("win32")
    language English

    set runtimepath+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call plug#begin(path)
else
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call plug#begin(glob('~/.vim/bundle'))
endif

" Plug 'AnsiEsc.vim'
" Plug 'DrawIt'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
if has("lua") && v:version > 703 && v:version < 800 && !has("win32") && !g:its_a_pi
    Plug 'Shougo/neocomplete.vim'
endif
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
if v:version > 703 && (has("python") && g:has_python || has("python3")) && !g:its_a_pi
    Plug 'SirVer/ultisnips'
endif
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'bohlender/vim-smt2'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'benmills/vimux'
Plug 'calebsmith/vim-lambdify'
Plug 'chrisbra/csv.vim'
" Plug 'davidhalter/jedi-vim'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'devjoe/vim-codequery'
Plug 'gmoshkin/bufkill.vim'
Plug 'gmoshkin/vim-kw'
Plug 'godlygeek/tabular'
" Plug 'fatih/vim-go'
if v:version > 703 && !g:its_a_pi
    Plug 'honza/vim-snippets'
endif
" Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-utils/vim-man'
Plug 'idanarye/vim-vebugger'
Plug 'jpalardy/vim-slime'
Plug 'jrozner/vim-antlr'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
if (has("python") && g:has_python || has("python3"))
    Plug 'klen/python-mode'
endif
Plug 'libclang-vim/libclang-vim'
Plug 'libclang-vim/vim-textobj-function-clang'
Plug 'libclang-vim/vim-textobj-clang'
Plug 'luochen1990/rainbow'
Plug 'lucapette/vim-textobj-underscore'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all' }
if v:version >= 800
    " Plug 'maralla/completor.vim'
endif
if has('packages')
    packadd! matchit
else
    Plug 'matchit.zip'
endif
Plug 'vim-perl/vim-perl6'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
" Plug 'vim-syntastic/syntastic'
Plug 'sgur/vim-textobj-parameter'
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-multiple-cursors'
" Plug 'terryma/vim-expand-region'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'VundleVim/Vundle.vim'
" Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

call plug#end()
"}}}
"""""""""""""""""""""""""""""""""""" OPTIONS """""""""""""""""""""""""""""""""""
"{{{
filetype plugin indent on

" if (!exists("b:foldmethod_set"))
"     set foldmethod=syntax
" endif

let g:c_space_errors = 1

set cursorline
"highlight the screen line of the cursor

set splitright
"opens new windows to the right from the old ones

set splitbelow

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

"Indent stuff
" set autoindent
set smartindent

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

" Specifies the number of milliseconds to wait until issueing a CursorHold
" autocmd. I don't know who told me to set it to 250 ms
set updatetime=100

" Show a menu of alternatives when completing with <TAB> in the cmd line
set wildmenu

" Disable the annoying as fuck preview window when using omni-complete
set completeopt-=preview

" Trying out this thing
" Update: It fucking sucks
set noignorecase
set nosmartcase

set virtualedit+=block

set fileencodings=utf-8,cp1251,cp866,default,latin1

let g:tex_flavor = 'tex'

if has("win32")
    set langmap=Èq,ˆw,Ûe,Ír,Ât,Ìy,„u,¯i,˘o,Áp,ı[,˙],Ùa,˚s,‚d,‡f,Ôg,h,Ój,Îk,‰l,Ê\\;,˝',ˇz,˜x,Òc,Ïv,Ëb,Ún,¸m,·\\,,˛.,…Q,÷W,”E, R,≈T,ÕY,√U,ÿI,ŸO,«P,’{,⁄},‘A,€S,¬D,¿F,œG,–H,ŒJ,ÀK,ƒL,∆\:,›\",ﬂZ,◊X,—C,ÃV,»B,“N,‹M,¡<,ﬁ>
else
    if (&term != 'xterm' && &term != 'xterm-color')
        set langmap=–πq,—Üw,—Ée,–∫r,–µt,–Ωy,–≥u,—ài,—âo,–∑p,—Ö[,—ä],—Ña,—ãs,–≤d,–∞f,–øg,—Äh,–æj,–ªk,–¥l,–∂\\;,—ç',—èz,—áx,—Åc,–ºv,–∏b,—Çn,—åm,–±\\,,—é.,–ôQ,–¶W,–£E,–öR,–ïT,–ùY,–ìU,–®I,–©O,–óP,–•{,–™},–§A,–´S,–íD,–êF,–üG,–†H,–ûJ,–õK,–îL,–ñ\:,–≠\",–ØZ,–ßX,–°C,–úV,–òB,–¢N,–¨M,–ë<,–Æ>
    endif
endif

if has("win32") || has("gui")
    set novisualbell
    set t_vb=
    "this stops the noisy beeping every time I press a button
endif

set errorformat+=%f:%l\ %m

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

" '~' behaves like an operator
set tildeop

" history size
set history=10000
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
if g:has_python || has('python')
    let g:pymode_python="python"
else
    let g:pymode_python="python3"
endif
let g:pymode_lint_ignore = ['E302', 'E201', 'E202', 'E203', 'E127', 'E741']
let g:pymode_lint_cwindow = 0
" let g:pymode_lint_on_write = 0
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
let g:airline_theme = 'mine'
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
            \ 't' : 'T',
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
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(exe|so|dll|pyc|o)$'
    \ }
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<c-h>'],
    \ 'PrtDeleteEnt()':       ['<c-x>'],
    \ 'AcceptSelection("h")': ['<c-cr>', '<c-s>'],
    \ }
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_lazy_update = 100
let g:ctrlp_mruf_exclude = 'COMMIT_EDITMSG'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
    \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir', 'autoignore']
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
let g:multi_cursor_start_key = 'g<C-J>'
let g:multi_cursor_next_key = '<C-J>'
let g:multi_cursor_prev_key = '<C-K>'
let g:multi_cursor_skip_key = '<C-L>'
let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 0

let g:multi_cursor_normal_maps = {
    \ '@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, '!': 1, 'c': 1, 'd': 1,
    \ 'f': 1, 'g': 1, 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, '<': 1,
    \ '=': 1, '>': 1
    \ }
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
""""""""""""""""""""""""""""""""""" ACK-VIM """"""""""""""""""""""""""""""""""""
"{{{
let g:ack_qhandler = "below copen"
let g:ack_lhandler = "below lopen"
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ackpreview = 1
"}}}
"""""""""""""""""""""""""""""""" CLANG_COMPLETE """"""""""""""""""""""""""""""""
"{{{
let g:clang_library_path = '/usr/lib/llvm-4.0/lib/libclang.so.1'
let g:clang_jumpto_declaration_key = '<leader><C-]>'
let g:clang_jumpto_back_key = '<leader><C-T>'
"}}}
""""""""""""""""""""""""""""""""""" ULTISNIPS """"""""""""""""""""""""""""""""""
"{{{
let g:ultisnips_python_quoting_style = 'single'
"}}}
""""""""""""""""""""""""""""""""""" COMPLETOR """"""""""""""""""""""""""""""""""
"{{{
let g:completor_complete_options = 'menuone,noselect'
"}}}
""""""""""""""""""""""""""""""""""" ASYNCRUN """""""""""""""""""""""""""""""""""
"{{{
command! Make AsyncRun -program=make
"}}}
""""""""""""""""""""""""""""""""" YOUCOMPLETEME """"""""""""""""""""""""""""""""
"{{{
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_stop_completion = []
let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/ycm_extra_conf.py'
"}}}
""""""""""""""""""""""""""""""""""" GITGUTTER """"""""""""""""""""""""""""""""""
"{{{
let g:gitgutter_preview_win_location = 'belowright'
"}}}
""""""""""""""""""""""""""""""""" LOCAL-CONFIG """""""""""""""""""""""""""""""""
"{{{
let g:local_vimrc = '~/.vim/vimrc-local'
if filereadable(expand(g:local_vimrc))
    execute "source ".expand(g:local_vimrc)
endif
"}}}
""""""""""""""""""""""""""""""""""" CHEAT.SH """""""""""""""""""""""""""""""""""
"{{{
" let g:CheatSheetProviders = ['quickfix', 'syntastic', '']
"}}}
""""""""""""""""""""""""""""""""" VIM-SURROUND """""""""""""""""""""""""""""""""
"{{{
let g:surround_{char2nr('t')} = "\1template: \1<\r>"
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !g:its_a_pi
    syntax enable
endif
