if !exists("g:kw_settings")
    let g:kw_settings = {
        \ "host": "localhost",
        \ "port": 9090,
        \ "user": "gmoshkin",
        \ "project": "cudafy",
        \ }
endif

if !exists("g:kw_comments")
    let g:kw_comments = {
        \ "Fix": "TP",
        \ "Not a problem": "FP",
        \ }
endif

" command! -nargs=1 KWFix SlimeSend1 action update_status ids=<args> status=Fix comment=TP owner=gmoshkin
" command! -nargs=1 KWNotAProblem SlimeSend1 action update_status ids=<args> status=Not+a+Problem comment=FP owner=gmoshkin
command! -nargs=1 KWFetchIssues %d | read !curl --data "action=search&user=gmoshkin&project=cudafy&query=<args>" http://localhost:9090/review/api
"TODO: add completion for searchable queries
command! -nargs=* KWSearchQueries %d <bar> call kw#search_queries(<q-args>)
command! KWSearchLastQuery %d <bar> call kw#search_last_query() <bar> 1
command! KWSearchCode %d <bar> call kw#search_queries("code")
command! KWLoadCode call kw#load_queries("code")
command! -nargs=1 KWSetQuery let g:kw_searchquery=<q-args>
command! KWGo exec 'normal 0/"file":"\zsyi""fyi"0/line":\zsyiw^["lyiw\jj;e f;exec @l]'
command! KWSetSettings call kw#set_settings()
command! -nargs=* KWUpdateStatus call kw#update_status(<q-args>)
command! KWFix call kw#update_status(input("Id: ", g:kw_current_issue_id), "Fix")
command! KWNotAProblem call kw#update_status(input("Id: ", g:kw_current_issue_id), "Not a Problem")
command! KWParseIssue call kw#parse_issue(getline('.'))
command! KWParseNext call kw#parse_next()
command! KWParsePrev call kw#parse_prev()

nnoremap <leader>kwf :<C-U>call kw#update_status(<C-R><C-W>, "Fix")<CR>
nnoremap <leader>kwn :<C-U>call kw#update_status(<C-R><C-W>, "Not a Problem")<CR>
nnoremap <leader>kwl :<C-U>KWSearchLastQuery<CR>
nnoremap <leader>kwc :<C-U>KWSearchCode<CR>
nnoremap <leader>kws :<C-U>KWLoadCode<CR>
nnoremap <leader>kw> :<C-U>KWParseNext<CR>
nnoremap <leader>kw< :<C-U>KWParsePrev<CR>
nnoremap <leader>kwp :<C-U>KWParseIssue<CR>

"TODO:
" * set the 'makeprg' option to the curl command
" * add a formatexpr for the resulting json
