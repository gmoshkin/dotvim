"TODO:
" * [x] write a plugin for compiling a single file and running the program in
"       the tmux pane
" * [ ] port plugin/run.vim for nvim
"   - for hashbang:
"       - split | terminal <cmd> %
"   - for rust:
"       - find Cargo.toml in starting from current file's directory going up
"       - split | terminal cargo run --manifest-path <Cargo.toml>
" * [ ] make rls work with a single rust file
" * [ ] alt-* mappings in nvim
" * [ ] add support for clip.exe on wsl

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
Plug 'Lokaltog/vim-easymotion'
if !exists('g:vscode')
    Plug 'Raimondi/delimitMate'
endif
if has("lua") && v:version > 703 && v:version < 800 && !has("win32") && !g:its_a_pi
    Plug 'Shougo/neocomplete.vim'
endif
if v:version > 703 && (has("python") && g:has_python || has("python3")) && !g:its_a_pi
    Plug 'SirVer/ultisnips'
endif
Plug 'gmoshkin/vim-colors-solarized'
Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'bohlender/vim-smt2'
if !exists('g:vscode')
    Plug 'bronson/vim-trailing-whitespace'
endif
" Plug 'chrisbra/csv.vim'
if !exists('g:vscode')
    Plug 'gmoshkin/bufkill.vim'
endif
Plug 'godlygeek/tabular'
" Plug 'fatih/vim-go'
if v:version > 703 && !g:its_a_pi
    Plug 'honza/vim-snippets'
endif
" Plug 'vim-utils/vim-man' " doesn't work with neovim
Plug 'idanarye/vim-vebugger'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'luochen1990/rainbow'
Plug 'lucapette/vim-textobj-underscore'
" Plug 'Konfekt/FastFold'
if has('packages')
    packadd! matchit
    packadd! termdebug
else
    Plug 'matchit.zip'
endif
" Plug 'vim-perl/vim-perl6'
if !exists('g:vscode')
    Plug 'mg979/vim-visual-multi'
endif
Plug 'junegunn/gv.vim'
if !exists('g:vscode')
    Plug 'nathanaelkane/vim-indent-guides'
endif
if has('nvim')
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
endif
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sgur/vim-textobj-parameter'
Plug 'tommcdo/vim-exchange'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'VundleVim/Vundle.vim'
" This is for ANSI colorization, don't know how you supposed to use it though...
Plug 'm00qek/baleia.nvim', { 'branch': 'main' }

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

" Turn off the fucking bell, who the fuck uses that shit, oh my god bro
set belloff=all

set virtualedit+=block

set fileencodings=utf-8,cp1251,cp866,default,latin1

let g:tex_flavor = 'tex'

if has("win32")
    set langmap=�q,�w,�e,�r,�t,�y,�u,�i,�o,�p,�[,�],�a,�s,�d,�f,�g,�h,�j,�k,�l,�\\;,�',�z,�x,�c,�v,�b,�n,�m,�\\,,�.,�Q,�W,�E,�R,�T,�Y,�U,�I,�O,�P,�{,�},�A,�S,�D,�F,�G,�H,�J,�K,�L,�\:,�\",�Z,�X,�C,�V,�B,�N,�M,�<,�>
else
    if (&term != 'xterm' && &term != 'xterm-color')
        set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>
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

set wildignore=*.o,*.ldf

" more complex bindings?
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"

" RIP grep
if len(system('hash rg')) == 0
    let &grepprg = 'rg --vimgrep $*'
endif

if exists('&inccommand')
    set inccommand=nosplit
endif
"}}}
"""""""""""""""""""""""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""
"{{{
function! SetIndentGuideColors()
    hi indentguidesodd  ctermbg=235 ctermfg=12
    hi indentguideseven ctermbg=236 ctermfg=12

    " vim is fucking shit
    hi ColorColumn ctermbg=235
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
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#csv#column_display = 'Name'
let g:airline_left_sep = "▄"
let g:airline_left_alt_sep = "⠢"
let g:airline_right_sep = "▄"
let g:airline_right_alt_sep = "⠔"
let g:airline_powerline_fonts = 0

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
let g:airline_symbols.linenr = ' '
let g:airline_symbols.colnr = ':'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 100,
    \ 'x': 90,
    \ 'y': 120,
    \ 'z': 80,
    \ 'warning': 100,
    \ 'error': 80,
    \ }
"}}}
"""""""""""""""""""""""""""""""" VIM-CODE-DARK """""""""""""""""""""""""""""""""
"{{{
if (&term != 'xterm' && &term != 'xterm-color')
    colorscheme codedark
    hi ColorColumn ctermbg=235
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
let g:indent_guides_enable_on_vim_startup = !exists('g:vscode')
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
let g:BufKillBwKey = 'ZB'
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
let g:ycm_use_clangd = 1
let g:ycm_open_loclist_on_ycm_diags = v:false
let g:ycm_auto_hover = ''
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
let g:surround_{char2nr('s')} = "\1struct: \1{\r}"
"}}}
""""""""""""""""""""""""""""""" VIM-VISUAL-MULTI """""""""""""""""""""""""""""""
"{{{
let g:VM_maps = {
    \ 'Find Under'         : '<c-j>',
    \ 'Find Subword Under' : '<c-j>',
    \ 'Add Cursor Down'    : '<esc><c-j>',
    \ 'Add Cursor Up'      : '<esc><c-k>',
    \ 'Skip Region'        : '<c-l>',
    \ 'Remove Region'      : '<c-h>',
    \ 'Undo'               : 'u',
    \ 'Redo'               : '<c-r>',
    \ 'Visual Cursors'     : '<c-s>',
    \ 'Align'              : '\t',
    \ 'Select Operator'    : 'v',
\ }
let g:VM_exit_on_1_cursor_left = v:true
"}}}
"""""""""""""""""""""""""""""""""""" RUN """""""""""""""""""""""""""""""""""""""
"{{{
let g:run_compiled = {
\   'c':    'clang %s -o %s',
\   'cpp':  'clang++ -std=c++2a %s -o %s',
\   'rust': 'rustc %s -o %s',
\}
"}}}
"""""""""""""""""""""""""""""""""" POLYGLOT """"""""""""""""""""""""""""""""""""
let g:rust_recommended_style = 0
""""""""""""""""""""""""""""""""""""" WSL """"""""""""""""""""""""""""""""""""""
if has('macunix') || is_wsl#is_wsl()
    set visualbell
    set t_vb=
endif

if is_wsl#is_wsl() && has('nvim')
    " XXX: is there a less ugly ass way to check for an executable?
    if len(system('hash clipboard.exe')) == 0
        lua << LUA
            function set_clip(lines, regtype)
                vim.g.clip_plus = { lines, regtype }
                local p = io.popen('clipboard.exe copy-stdin', 'w')
                p:write(table.concat(lines, '\n'))
                p:close()
            end
            function get_clip()
                local p = io.popen('clipboard.exe paste', 'r')
                local data = p:read('*all')
                p:close()
                return vim.split(data, "\n")
            end
LUA
        let g:clipboard = {
        \   'name': 'clipboard.exe',
        \   'copy': {
        \        '+': {
        \           lines, kind -> luaeval('set_clip(_A[1], _A[2])', [lines, kind])
        \        },
        \        '*': { lines, kind -> extend(g:, {'clip_star': [lines, kind]}) },
        \   },
        \   'paste': {
        \        '+': { -> luaeval('get_clip()') },
        \        '*': { -> get(g:, 'clip_star', []) },
        \   },
        \   'cache_enabled': v:true,
        \ }

    else " fallback to clip.exe, but really you should get clipboard.exe though

        lua << LUA
            function set_clip(lines, regtype)
                vim.g.clip_plus = { lines, regtype }
                local p = io.popen('/mnt/c/Windows/system32/clip.exe', 'w')
                p:write(table.concat(lines, '\n'))
                p:close()
            end
LUA

        let g:clipboard = {
        \   'name': 'clip.exe',
        \   'copy': {
        \        '+': {
        \           lines, kind -> luaeval('set_clip(_A[1], _A[2])', [lines, kind])
        \        },
        \        '*': { lines, kind -> extend(g:, {'clip_star': [lines, kind]}) },
        \   },
        \   'paste': {
        \        '+': { -> ["not supported ☺"] },
        \        '*': { -> get(g:, 'clip_star', []) },
        \   },
        \   'cache_enabled': v:true,
        \ }
    endif
elseif has('nvim')
    lua << LUA
        function set_xsel_and_tmux(lines, regtype)
            vim.g.clip_plus = { lines, regtype }
            local text = table.concat(lines, '\n')
            local p = io.popen('xsel --clipboard -i', 'w')
            p:write(text) p:close()
            local p = io.popen('tmux load-buffer -', 'w')
            p:write(text) p:close()
        end
LUA
    let g:clipboard = {
    \   'name': 'xsel',
    \   'copy': {
    \        '+': {
    \           lines, kind -> luaeval('set_xsel_and_tmux(_A[1], _A[2])', [lines, kind])
    \        },
    \   },
    \   'paste': {
    \        '+': ['xsel', '--clipboard', '-o'],
    \   },
    \   'cache_enabled': v:true,
    \ }
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !g:its_a_pi
    syntax enable
endif

" Does neovim have this kind of shit?
highlight! link SignColumn LineNr
