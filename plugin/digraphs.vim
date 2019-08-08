if !exists('g:subsuperscripts_file')
    let g:subsuperscripts_file = expand('~/dotfiles/subsuperscripts.json')
endif

func s:set_scripts(data) abort
    for [digraphs, postfix] in [
                \[a:data.subscript,   '_'],
                \[a:data.superscript, '^']
        \]
        for [letter, dict] in items(digraphs)
            let s:digraph = letter.postfix
            execute join(["digraph", s:digraph, dict.number], ' ')
            let digraphs[letter].digraph = s:digraph
        endfor
    endfor
endf

if filereadable(g:subsuperscripts_file)
    call s:set_scripts(json_decode(join(readfile(g:subsuperscripts_file))))
else
    echom '"'.g:subsuperscripts_file.'" not found'
endif

digraph :( 9785 "☹
digraph :) 9786 "☺
digraph (: 9787 "☻
