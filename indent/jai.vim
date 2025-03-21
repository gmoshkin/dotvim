" I started from jansedivy/jai.vim but then I changed pretty much everything, so...
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nosmartindent
setlocal nolisp
setlocal autoindent

setlocal indentexpr=GetJaiIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,=case

function! GetJaiIndent(lnum)
    let l:prev_lineno = prevnonblank(a:lnum-1)

    if l:prev_lineno == 0
        return 0
    endif

    let l:this_line = F_strip_comment_and_trim(getline(a:lnum))

    " RIP Bram, but you're fucking retarded, look at this fucking indexing jesus fucking christ...
    if l:this_line[:3] == 'case'
        let l:cursor = prevnonblank(a:lnum-1)
        while l:cursor > 0
            let l:cur_line = F_strip_comment_and_trim(getline(l:cursor))
            if l:cur_line[0] == '}'
                return indent(l:cursor) - &sw
            elseif l:cur_line[:3] == 'case'
                return indent(l:cursor)
            " Yeah, -1 doesn't work with indexing by single character, only by slice...
            elseif (l:cur_line[:1] == 'if' || l:cur_line[:2] == '#if') && l:cur_line[-1:] == '{'
                return indent(l:cursor)
            endif
            let l:cursor -= 1
        endwhile
        " Some weird case, just return whatever
        return 0
    endif

    let l:prev_line = F_strip_comment_and_trim(getline(l:prev_lineno))

    let l:prev_end = l:prev_line[-1:]
    let l:open_brackets = l:prev_end == '[' || l:prev_end == '(' || l:prev_end == '{'
    let l:prev_closed = l:prev_end == ';' || l:prev_end == '}'

    let l:this_start = l:this_line[0]
    let l:closed_brackets = l:this_start == ']' || l:this_start == ')' || l:this_start == '}'

    if l:open_brackets
        if l:closed_brackets
            return indent(l:prev_lineno)
        else
            return indent(l:prev_lineno) + &sw
        endif
    endif

    if l:closed_brackets
        return indent(l:prev_lineno) - &sw
    endif

    if l:prev_closed
        if l:prev_line[:3] == 'case'
            return indent(l:prev_lineno) + &sw
        elseif l:prev_line[:3] == 'else'
            return indent(prevnonblank(l:prev_lineno - 1))
        else
            return indent(l:prev_lineno)
        endif
    else
        if l:prev_line[:1] == 'if' || l:prev_line[:2] == 'for' || l:prev_line[:4] == 'while'
            if l:this_line[0] == '{'
                return indent(l:prev_lineno)
            else
                return indent(l:prev_lineno) + &sw
            endif
        elseif l:prev_line =~ '\v<ifx>'
            let l:then_offset = stridx(getline(l:prev_lineno), 'then')
            if l:then_offset != -1
                return l:then_offset
            else
                return indent(l:prev_lineno) + &sw
            endif
        endif
    endif

    return indent(l:prev_lineno)
endfunction

function! F_strip_comment(line) abort
    let l:comment_start = stridx(a:line, '//')
    if l:comment_start != -1
        return trim(a:line[0:l:comment_start - 1])
    endif

    return a:line
endfunction
