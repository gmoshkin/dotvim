" open help in the current window (don't create a split)
command! -nargs=* -complete=help Help call windows#open_full_window("help", <f-args>)
command! -nargs=* -complete=help H call windows#open_full_window("help", <f-args>)

" open Man in the current window (don't create a split)
command! -nargs=* -complete=customlist,man#completion#run M call windows#open_full_window("Man", <f-args>)

" execute a command in another window
command! -nargs=* -complete=command W call windows#exec_in_window(<q-args>)
command! -nargs=* -complete=command R call windows#exec_in_window(<q-args>, 'r')
command! -nargs=* -complete=command L call windows#exec_in_window(<q-args>, 'l')

" edit vimrc
command! Vimrc edit $MYVIMRC

" echo the arguments (idk why I need this)
command! -nargs=* EchoArgs call misc#echo_args(<f-args>)

" show git diff --cached in a tmux pane
command! GD SlimeSend1 git diff --cached

command! V3 only <bar> vsplit <bar> vsplit <bar> 2wincmd w

command! -nargs=* Gitlog Git! log <args>
command! -nargs=* Gitdiff Git! diff <args>
command! -nargs=* Gitshow Git! show <args>
command! -nargs=* Gshow Git! show <args>
command! -nargs=* Grc Git rebase --continue <args>
command! -nargs=* Gra Git rebase --abort <args>

command! -nargs=* Gri call git#run_command('rebase --interactive', git#process_argument(<q-args>))

command! MakeExecutable !chmod +x %

command! SudoWrite write !sudo tee %

command! -bang -nargs=* RAck           Ack           <bang> <args> %:p:h
command! -bang -nargs=* RAckAdd        AckAdd        <bang> <args> %:p:h
command! -bang -nargs=* RAckFile       AckFile       <bang> <args> %:p:h
command! -bang -nargs=0 RAckFromSearch AckFromSearch <bang> %:p:h

command! FindConflict /^<<<<<<<\|^=======\|^>>>>>>>
command! SourceBashrc SlimeSend1 source ~/.bashrc
