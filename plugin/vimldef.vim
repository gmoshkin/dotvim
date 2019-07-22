command! -nargs=? -complete=command CmdDef call vimldef#cmd2qf(<q-args>)
command! -nargs=? -complete=function FuncDef call vimldef#func2qf(<q-args>)
