syntax enable

"colorscheme aldmeris
"Oblivion-like colorscheme

highlight ClosingSpace ctermbg=red
match ClosingSpace /\( $\|	$\)/
"highlight space characters in the end of lines

"highlight OverLength cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#592929
"match OverLength /\%81v.\+/
"highlight text in 81+ columns

highlight CursorLine cterm=bold,underline
"this one should probably be in a colorscheme file

"highlight ColorColumn ctermbg=grey
"set colorcolumn=81
"highlight 81st column

set foldmethod=syntax
"   manual - Folds are created manually.
"   indent - Lines with equal indent form a fold.
"   expr   - 'foldexpr' gives the fold level of a line.
"   marker - Markers are used to specify folds.
"   syntax - Syntax highlighting items specify folds.
"   diff   - Fold text that is not changed.

"au BufRead *	normal zR
" Folds are open by default

autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440
"autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl	setf glsl
" OpenGL Shader Languauge

set scrolloff=1
"number of screen lines to show around the cursor

set showbreak=~
"string to put before wrapped screen lines

set cursorline
"highlight the screen line of the cursor

set display=
"Include "lastline" to show the last line even if it doesn't fit
"Include "uhex" to show unprintable characters as a hex number

set tags=./tags,./TAGS,tags,TAGS,~/tags
"list of paths to search for tag files
"the last one is added by me

set expandtab
"replace tabs with spaces

set number
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch

set incsearch
"Display the match for a search pattern when halfway typing it.

set showcmd
"Display an incomplete command in the lower right corner of the Vim window, left of the ruler.

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>

filetype plugin indent on
"This switches on three very clever mechanisms:
"1. Filetype detection.
"   Whenever you start editing a file, Vim will try to figure out what kind of
"   file this is.  When you edit "main.c", Vim will see the ".c" extension and
"   recognize this as a "c" filetype.  When you edit a file that starts with
"   "#!/bin/sh", Vim will recognize it as a "sh" filetype.
"   The filetype detection is used for syntax highlighting and the other two
"   items below.
"   See |filetypes|.
"
"2. Using filetype plugin files
"   Many different filetypes are edited with different options.  For example,
"   when you edit a "c" file, it's very useful to set the 'cindent' option to
"   automatically indent the lines.  These commonly useful option settings are
"   included with Vim in filetype plugins.  You can also add your own, see
"   |write-filetype-plugin|.
"
"3. Using indent files
"   When editing programs, the indent of a line can often be computed
"   automatically.  Vim comes with these indent rules for a number of
"   filetypes.  See |:filetype-indent-on| and 'indentexpr'.

"map <F2> <ESC>:w<CR>
map <F3> <ESC>:tabnew<CR>
map <F4> <ESC>:e .<CR>
map <F5> <ESC>:cprev<CR>
map <F6> <ESC>:cnext<CR>
map <F7> <ESC>:noh<CR>
map <S-F7> <ESC>/ $<CR>
map <F8> <ESC>:cnext<CR>
map <S-F8> <ESC>:cprev<CR>
map <F9> <ESC>:make<CR>
map <S-F9> <ESC>:make clean<CR>
map <F12> <ESC>:source ~/.vimrc<CR>

"map co gI// <ESC>
"map cu ^3x
"map cs O/*<ESC>
"map cS O*/<ESC>

map <C-N> <ESC>:bnext<CR>
map <C-P> <ESC>:bprev<CR>

noremap <C-S> <ESC>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>

map <C-Up> <C-Y>
map <C-Down> <C-E>
imap <C-Up> <C-O><C-Y>
imap <C-Down> <C-O><C-E>

map <M-Left> <C-W><
map <M-Right> <C-W>>
map <M-Up> <C-W>+
map <M-Down> <C-W>-

map <Leader>y "+y
vmap <Leader>y "+y
map <Leader>p "+p
vmap <Leader>p "+p

map <Leader><C-H> <ESC>:help <C-R><C-A><CR>
map <C-H> <ESC>:help <C-R><C-W><CR>

map ZA zA
map ZM zM
map ZR zR
map ZO zO
map ZC zC
