"vimrc by gmoshkin
syntax enable

filetype plugin indent on
"This switches on three very clever mechanisms:"{{{
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
"   filetypes.  See |:filetype-indent-on| and 'indentexpr'."}}}

set foldmethod=syntax
"   manual - Folds are created manually."{{{
"   indent - Lines with equal indent form a fold.
"   expr   - 'foldexpr' gives the fold level of a line.
"   marker - Markers are used to specify folds.
"   syntax - Syntax highlighting items specify folds.
"   diff   - Fold text that is not changed."}}}

"colorscheme aldmeris
"Oblivion-like colorscheme

"let g:c_space_errors = 1
highlight ClosingSpace ctermbg=red
match ClosingSpace /\s\+$/
"highlight space characters in the end of lines

"highlight OverLength cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#592929
"match OverLength /\%81v.\+/
"highlight text in 81+ columns

highlight CursorLine cterm=bold,underline
"this one should probably be in a colorscheme file

"highlight ColorColumn ctermbg=grey
"set colorcolumn=81
"highlight 81st column

autocmd BufRead *	normal zR
" Folds are open by default

autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440
"autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl	setf glsl
" OpenGL Shader Languauge

augroup VimrcFiletype
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END

set splitright
"opens new windows to the right from the old ones

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
set smartindent
set hlsearch

set incsearch
"Display the match for a search pattern when halfway typing it.

set showcmd
"Display an incomplete command in the lower right corner of the Vim window, left of the ruler.

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>
set backspace=indent,eol,start
"This specifies where in Insert mode the <BS>> is allowed to delete the
"character in front of the cursor.  The threee items, separated by commas, tell
"Vim to delete the white space at the start oof the line, a line break and the
"character before where Insert mode started.

"""""""""""""""""""""""""""""""""" KEY MAPS """"""""""""""""""""""""""""""""""""

"{{{
"map <F2> <ESC>:w<CR>
map <F2> <ESC>[[{jyf)<C-O><C-O>:echo @0<CR>
map <F3> <ESC>:tabnew<CR>
map <F4> <ESC>:e .<CR>
map <F5> <ESC>:cprev<CR>
map <F6> <ESC>:cnext<CR>
map <F7> <ESC>:noh<CR>
map <S-F7> <ESC>/ $<CR>
map <F8> <ESC>:cfirst<CR>
map <S-F8> <ESC>:clast<CR>
map <F9> <ESC>:make!<CR>:copen<CR>
map <S-F9> <ESC>:make! clean<CR>
map <F10> <ESC>:echo GetSyntaxInfo()<CR>
map <F12> <ESC>:source $MYVIMRC<CR>

"map <C-N> <ESC>:tabnext<CR>
"map <C-P> <ESC>:tabprev<CR>
map <C-N> <ESC>:bnext<CR>
map <C-P> <ESC>:bprev<CR>

noremap <C-S> <ESC>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>
"on ubuntu this one requires the following record in .bashrc file:
"stty -ixon

noremap <S-Left> zh
noremap <S-Right> zl
inoremap <S-Left> <C-O>zh
inoremap <S-Right> <C-O>zl

noremap <S-Up> <C-Y>
noremap <S-Down> <C-E>
inoremap <S-Up> <C-O><C-Y>
inoremap <S-Down> <C-O><C-E>

map <C-Up> <C-Y>
map <C-Down> <C-E>
imap <C-Up> <C-O><C-Y>
imap <C-Down> <C-O><C-E>

map <C-]> <ESC>:tjump <C-R><C-W><CR>

map <M-Left> <C-W><
map <M-Right> <C-W>>
map <M-Up> <C-W>+
map <M-Down> <C-W>-

map <Leader>y "+y
vmap <Leader>y "+y
map <Leader>Y "+Y
vmap <Leader>Y "+Y
map <Leader>p "+p
vmap <Leader>p "+p
map <Leader>P "+P
vmap <Leader>P "+P

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

inoremap <C-B> <Left>
inoremap <C-F> <Right>
"map <Leader><C-H> <ESC>:help <C-R><C-A><CR>
"map <C-H> <ESC>:help <C-R><C-W><CR>

map ZA zA
map ZM zM
map ZR zR
map ZO zO
map ZC zC
map ZN zN
"}}}

"""""""""""""""""""""""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""

"{{{
function! SetTabStop()
	if search("	", 'n')
		setlocal noexpandtab
	else
		let ts = CheckTabStop()
		if ts
			setlocal expandtab
			execute "setlocal tabstop=" . ts
			execute "setlocal shiftwidth=" . ts
		endif
	endif
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
	"let id = synID(line("."),col("."),0)
	let stack = synstack(line("."),col("."))
	"return join([synIDattr(id,"name"), synIDattr(id,"fg","cterm"), synIDattr(id,"bg","cterm")])
	return join(map(stack, "synIDattr(v:val,\"name\")"))
endfunction
"}}}

"""""""""""""""""""""""""""""""" AUTOCOMMANDS """"""""""""""""""""""""""""""""""

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
	autocmd FileWritePost *vimrc source %
augroup END

"""""""""""""""""""""""""""""""" PYTHON-MODE """""""""""""""""""""""""""""""""""

let g:pymode = 1
let g:pymode_doc_bind = 'K'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_options_colorcolumn = 0
