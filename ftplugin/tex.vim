noremap <buffer> <Leader>mp <ESC>:!pdflatex %:p<CR>
noremap <buffer> <Leader>mb <ESC>:execute '!bibtex '.split(expand('%:p'), '\.')[0].'.aux'<CR>
" noremap <buffer> <C-S> <ESC>:update<CR>:!pdflatex %:p<CR>
" inoremap <buffer> <C-S> <C-O>:update<CR><C-O>:!pdflatex %:p<CR>
" vnoremap <buffer> <C-S> <C-C>:update<CR>:!pdflatex %:p<CR>

setlocal spell
setlocal formatoptions+=t
" call toggle#auto_format(1, 0)

" let g:latex_main_filename = "/home/gmoshkin/Documents/cmc/english/report-2/main.tex"
" let g:latex_options = "-output-directory /home/gmoshkin/Documents/cmc/english/report-2/out"
let g:latex_build_on_save = 0

function! s:get_main_filename() abort
    if !exists("g:latex_main_filename")
        echoerr "please set the 'g:latex_main_filename' variable"
        return -1
    else
        return g:latex_main_filename
    endif
endfunction

function! s:run_cmd(cmd, ...) abort
    if a:0 < 1
        let l:filename = s:get_main_filename()
    else
        let l:filename = a:1
    endif
    if l:filename == -1
        return
    endif
    if !exists("g:latex_options")
        let g:latex_options = ""
    endif
    execute join(["SlimeSend1", a:cmd, g:latex_options, l:filename], " ")
endfunction

function! s:tex_to_aux(filename) abort
    return substitute(a:filename, '^.*/\([^/]\+\)\.tex$', '\1', '')
endfunction

command! MakeLatex call s:run_cmd("pdflatex", expand('%:p'))
command! MakeBib call s:run_cmd("bibtex", s:tex_to_aux(s:get_main_filename()))
command! MakeLatexMain call s:run_cmd("pdflatex")

function! s:auto_make() abort
    if exists("g:latex_build_on_save") && g:latex_build_on_save != 0
        MakeLatexMain
    endif
endfunction

augroup MakeLatex
    autocmd BufWritePost *.tex call s:auto_make()
augroup END

" augroup LatexAutoFormat
"     autocmd! InsertEnter <buffer> call toggle#auto_format(1, 0)
"     autocmd! InsertLeave <buffer> call toggle#auto_format(0, 0)
" augroup END
