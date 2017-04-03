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

command! -count=150 Gitlog Git! log -<count>
