noremap <buffer> <Leader>mp <ESC>:!pdflatex %:p<CR>
noremap <buffer> <Leader>mb <ESC>:execute '!bibtex '.split(expand('%:p'), '\.')[0].'.aux'<CR>
" noremap <buffer> <C-S> <ESC>:update<CR>:!pdflatex %:p<CR>
" inoremap <buffer> <C-S> <C-O>:update<CR><C-O>:!pdflatex %:p<CR>
" vnoremap <buffer> <C-S> <C-C>:update<CR>:!pdflatex %:p<CR>

setlocal spell
" call toggle#auto_format(1, 0)

let g:latex_main_filename = "/home/gmoshkin/Documents/cmc/english/report-2/main.tex"
let g:latex_options = "-output-directory /home/gmoshkin/Documents/cmc/english/report-2/out"

function! s:run_cmd(cmd, ...) abort
    if a:0 < 1
        if !exists("g:latex_main_filename")
            echoerr "please set the 'g:latex_main_filename' variable"
            return
        else
            let l:filename = g:latex_main_filename
        endif
    else
        let l:filename = a:1
    endif
    if !exists("g:latex_options")
        let g:latex_options = ""
    endif
    execute join(["SlimeSend1", a:cmd, g:latex_options, l:filename], " ")
endfunction

command! MakeLatex call s:run_cmd("pdflatex", expand('%:p'))
command! MakeBib call s:run_cmd("bibtex", "main.aux")
command! MakeLatexMain call s:run_cmd("pdflatex")
