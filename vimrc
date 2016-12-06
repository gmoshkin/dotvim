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
Plugin 'gmoshkin/bufkill.vim'
Plugin 'calebsmith/vim-lambdify'
Plugin 'chrisbra/csv.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'devjoe/vim-codequery'
Plugin 'duff/vim-scratch'
Plugin 'gmarik/Vundle.vim'
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
Plugin 'klen/python-mode'
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
function! ToggleAutoFormat()
    if !exists('b:auto_format_enabled')
        let b:auto_format_enabled = 0
    endif
    if b:auto_format_enabled
        setlocal formatoptions-=a
        setlocal formatoptions-=t
        echo 'autoformat disabled'
    else
        setlocal formatoptions+=a
        setlocal formatoptions+=t
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

function! FooBar(...)
    echo get(a:, '0', -1)
    echo get(a:, '1', 'a:1')
    echo get(a:, '2', 'a:2')
    echo get(a:, '3', 'a:3')
endfunction

" Stole it from codequery plugin
function! FilterQfResults(args) abort
    let args = split(a:args, ' ')
    if len(args) > 1
        let query = args[1]
        let reverse_filter = 1
    else
        let query = args[0]
        let reverse_filter = 0
    endif
    echom query

    let qf_list = getqflist()
    for qf_row in qf_list
        if reverse_filter
            if bufname(qf_row['bufnr']) =~ query || qf_row['text'] =~ query
                call remove(qf_list, index(qf_list, qf_row))
            endif
        else
            if bufname(qf_row['bufnr']) !~ query && qf_row['text'] !~ query
                call remove(qf_list, index(qf_list, qf_row))
            endif
        endif
    endfor
    call setqflist(qf_list)
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

function! EchoArgs(...)
    if exists("a:000")
        echo a:000
    else
        echo "no args"
    endif
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

function! AddREPToPath()
    let filePath = expand("%:p")
    let subDir = matchstr(filePath, ".*REP/sources/[^/]*/")
    if &path !~# subDir
        let newEntry = ','.subDir.'**,'
        let &path = &path . newEntry
    endif
endfunction

function! StageLines(ls, le)
    let hunk = gitgutter#hunk#current_hunk()
    if len(hunk) != 4
        return
    endif

    let orig_line = line('.')
    let orig_col = col('.')

    let lines_to_stage = utils#get_lines(a:ls, a:le)

    let [ols, oln, nls, nln] = hunk
    let nle = nls + nln - 1
    let hunk_lines = utils#get_lines(nls, nle)

    " Delete the hunk
    silent execute nls.','.nle.'d'
    " Insert the lines to be staged
    call append(nls - 1, lines_to_stage)

    " Put the cursor inside the hunk and stage it
    call cursor(nls, 0)
    call gitgutter#stage_hunk()

    " Undo file modifications
    silent undo
    silent write
    call cursor(orig_line, orig_col)
endfunction
"}}}
"""""""""""""""""""""""""""""""" AUTOCOMMANDS """"""""""""""""""""""""""""""""""
"{{{

" Folds are open by default
augroup OpenFolds
    autocmd!
    autocmd BufEnter * normal zR
augroup END

augroup REPPath
    autocmd!
    autocmd BufNew,BufRead */REP/sources/* call AddREPToPath()
augroup END
"}}}
"""""""""""""""""""""""""""""""""" COMMANDS """"""""""""""""""""""""""""""""""""
"{{{
command! -nargs=* QfFilter call FilterQfResults(<q-args>)
command! -nargs=* EchoArgs call EchoArgs(<f-args>)
command! -nargs=* -complete=help Help call windows#open_full_window("help", <f-args>)
command! -nargs=* -complete=help H call windows#open_full_window("help", <f-args>)
command! Vimrc edit $MYVIMRC
command! -range StageLine call StageLines(<line1>, <line2>)
command! -nargs=* -complete=customlist,man#completion#run M call windows#open_full_window("Man", <f-args>)
command! -nargs=* -complete=command W call windows#exec_in_window(<q-args>)
command! -nargs=* -complete=command R call windows#exec_in_window(<q-args>, 'r')
command! -nargs=* -complete=command L call windows#exec_in_window(<q-args>, 'l')
"}}}
"""""""""""""""""""""""""""""""""" KEY MAPS """"""""""""""""""""""""""""""""""""
"{{{

noremap <C-N> <ESC>:bnext<CR>
noremap <C-P> <ESC>:bprev<CR>

"on ubuntu this one requires the following record in .bashrc file:
"stty -ixon
noremap <C-S> :<C-U>update<CR>

nnoremap <C-@> :<C-U>nohlsearch<CR>

noremap <silent> <S-Left> @='3zh'<CR>
noremap <silent> <S-Right> @='3zl'<CR>

noremap <S-Up> <C-Y>
noremap <S-Down> <C-E>

noremap <C-]> <ESC>:tjump <C-R><C-W><CR>

noremap <M-Left> <C-W><
noremap <M-Right> <C-W>>
noremap <M-Up> <C-W>+
noremap <M-Down> <C-W>-
noremap <ESC>< <C-W><
noremap <ESC>> <C-W>>
noremap <ESC>+ <C-W>+
noremap <ESC>- <C-W>-

noremap gy "+y
noremap gY "+Y
noremap gp "+p
noremap gP "+P
vnoremap gy "+y
vnoremap gY "+Y
vnoremap gp "+p
vnoremap gP "+P

" remap the origianl gp and gP commands to <leader>p/P
noremap <leader>p gp
noremap <leader>P gP
vnoremap <leader>p gp
vnoremap <leader>P gP

noremap <Leader>V <ESC>ggVG


noremap <Leader>w <ESC>:Gwrite<CR>

noremap Q ZQ

noremap Y y$

noremap ; :
noremap : ;

noremap <Leader>( <ESC>:call FoldArgumentsOntoMultipleLines()<CR>

noremap <Leader>hl :StageLine<CR>:GitGutter<CR>
xnoremap <Leader>hl :StageLine<CR>:GitGutter<CR>

noremap cog <ESC>:IndentGuidesToggle<CR>
noremap cof <ESC>:call ToggleAutoFormat()<CR>
noremap coa <ESC>:call ToggleColorColumn()<CR>
noremap cop <ESC>:set paste!<CR>
noremap coR <ESC>:RainbowToggle<CR>

noremap K <ESC>:Man <C-R><C-W><CR>

nnoremap g/ <ESC>/\C
nnoremap <ESC>/ /\v

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
let g:multi_cursor_exit_from_visual_mode = 0
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
let g:extra_whitespace_ignored_filetypes = ['help', 'man']
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
