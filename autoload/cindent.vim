" Stolen from klen/python-mode
function! cindent#search_parens_pair()
    let line = line('.')
    let col = col('.')

    " Skip strings and comments and don't look too far
    let maxlines = 20
    let skip = "line('.') < " . (line - 10) . " ? 1 :" . 'synIDattr(synID(line("."), col("."), 0), "name") =~? ' . '"string\\|comment\\|doctest"'

    " Search for parentheses
    call cursor(line, col)
    let parlnum = searchpair('(', '', ')', 'bW', skip)
    let parcol = col('.')

    " Search for brackets
    call cursor(line, col)
    let par2lnum = searchpair('\[', '', '\]', 'bW', skip)
    let par2col = col('.')

    " Search for braces
    " call cursor(line, col)
    " let par3lnum = searchpair('{', '', '}', 'bW', skip)
    " let par3col = col('.')

    " Get the closest match
    if par2lnum > parlnum || (par2lnum == parlnum && par2col > parcol)
        let parlnum = par2lnum
        let parcol = par2col
    endif
    " if par3lnum > parlnum || (par3lnum == parlnum && par3col > parcol)
    "     let parlnum = par3lnum
    "     let parcol = par3col
    " endif

    " Put the cursor on the match
    if parlnum > 0
        call cursor(parlnum, parcol)
    endif
    return parlnum
endfunction

function! cindent#cindent(lnum)
    " First line has indent 0
    if a:lnum == 1
        return 0
    endif
    " If we can find an open parenthesis/bracket/brace, line up with it.
    call cursor(a:lnum, 1)
    let parlnum = cindent#search_parens_pair()
    if parlnum > 0
        let parcol = col('.')
        let closing_paren = match(getline(a:lnum), '^\s*[])}]') != -1
        if match(getline(parlnum), '[([{]\s*$', parcol - 1) != -1
            if closing_paren
                return indent(parlnum)
            else
                return indent(parlnum) + &shiftwidth
            endif
        else
            return parcol
        endif
    endif
    " In all other cases, line up with the start of the previous statement.
    return cindent(a:lnum)
endfunction
