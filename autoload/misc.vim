function! misc#echo_args(...)
    if exists("a:000")
        echo a:000
    else
        echo "no args"
    endif
endfunction

function! misc#get_syntax_info()
    "let id = synID(line("."), col("."), 0)
    let stack = synstack(line("."), col("."))
    "return join([synIDattr(id, "name"), synIDattr(id, "fg", "cterm"), synIDattr(id, "bg", "cterm")])
    return join(map(stack, "synIDattr(v:val, \"name\")"))
endfunction

function! misc#get_next_char(c)
    return nr2char(char2nr(a:c) + 1)
endfunction

function! misc#get_prev_char(c)
    return nr2char(char2nr(a:c) - 1)
endfunction

function! misc#put_next_char()
    let i = v:count1
    normal mu
    normal yl
    while i > 0
        execute 'normal r' . misc#get_next_char(@0)
        normal `u
        let i = i - 1
    endwhile
endfunction

function! misc#put_prev_char()
    let i = v:count1
    normal mu
    normal yl
    while i > 0
        execute 'normal r' . misc#get_prev_char(@0)
        normal `u
        let i = i - 1
    endwhile
endfunction

function! misc#curr_file() abort
    return fnameescape(expand('%'))
endfunction

function! misc#curr_path() abort
    return fnameescape(expand('%:p'))
endfunction

function! misc#curr_dir() abort
    return fnameescape(expand('%:p:h'))
endfunction

function! misc#get_cursor_position() abort
    let l = line(".")
    let c = col(".")
    return [l, c]
endfunction

function! misc#set_cursor_position(pos) abort
    call cursor(a:pos[0], a:pos[1])
endfunction

function! misc#git_dir() abort
    let l:git_dir = misc#curr_dir()
    if exists('b:git_dir')
        let l:git_dir = b:git_dir
    elseif exists('*FugitiveExtractGitDir()')
        let l:git_dir = FugitiveExtractGitDir(expand('%'))
    endif
    return substitute(l:git_dir, '.git$', '', '')
endfunction

function! misc#print_file_and_location() abort
    redir => l:command_output
    silent file
    redir END

    let l:command_output = trim(l:command_output)
    let l:full_file_path = fnameescape(expand('%:p'))
    let l:line = line(".")
    let l:col = col(".")
    echo printf("%s | %s:%s,%s", l:command_output, l:full_file_path, l:line, l:col)
endfunction
