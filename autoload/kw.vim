if !exists("g:kw_checkers_cs")
    let g:kw_checkers_cs = [
        \ "CS.ASSIGN.SELF",
        \ "CS.CMP.VAL.NULL",
        \ "CS.CONSTCOND.DO",
        \ "CS.CONSTCOND.IF",
        \ "CS.CONSTCOND.SWITCH",
        \ "CS.CONSTCOND.TERNARY",
        \ "CS.CONSTCOND.WHILE",
        \ "CS.CTOR.VIRTUAL",
        \ "CS.EMPTY.CATCH",
        \ "CS.FLOAT.EQCHECK",
        \ "CS.FRACTION.LOSS",
        \ "CS.HIDDEN.MEMBER.LOCAL.CLASS",
        \ "CS.HIDDEN.MEMBER.LOCAL.STRUCT",
        \ "CS.HIDDEN.MEMBER.PARAM.CLASS",
        \ "CS.HIDDEN.MEMBER.PARAM.STRUCT",
        \ "CS.IFACE.EMPTY",
        \ "CS.LOOP.STR.CONCAT",
        \ "CS.NPS",
        \ "CS.NRE.CHECK.CALL.MIGHT",
        \ "CS.NRE.CHECK.CALL.MUST",
        \ "CS.NRE.CHECK.MIGHT",
        \ "CS.NRE.CHECK.MUST",
        \ "CS.NRE.CONST.CALL",
        \ "CS.NRE.CONST.DEREF",
        \ "CS.NRE.FUNC.CALL.MIGHT",
        \ "CS.NRE.FUNC.CALL.MUST",
        \ "CS.NRE.FUNC.MIGHT",
        \ "CS.NRE.FUNC.MUST",
        \ "CS.NRE.GEN.CALL.MIGHT",
        \ "CS.NRE.GEN.CALL.MUST",
        \ "CS.NRE.GEN.MIGHT",
        \ "CS.NRE.GEN.MUST",
        \ "CS.OVRD.EQUALS",
        \ "CS.RCA",
        \ "CS.RLK",
        \ "CS.RNRE",
        \ "CS.SQL.INJECT.LOCAL",
        \ "CS.UNCHECKED.CAST",
        \ "CS.UNCHECKED.LOOPITER.CAST",
        \ "CS.WRONG.CAST",
        \ "CS.WRONG.CAST.MIGHT",
        \ "CS.WRONGSIG.CMPTO",
        \ "CS.WRONGUSE.REFEQ",
        \ ]
endif
if !exists("g:kw_checkers_cpp")
    let g:kw_checkers_cpp = [
        \ "ABV.ANY_SIZE_ARRAY",
        \ "ABV.GENERAL",
        \ "ABV.ITERATOR",
        \ "ABV.MEMBER",
        \ "ABV.STACK",
        \ "ABV.TAINTED",
        \ "ABV.UNICODE.BOUND_MAP",
        \ "ABV.UNICODE.FAILED_MAP",
        \ "ABV.UNICODE.NNTS_MAP",
        \ "ABV.UNICODE.SELF_MAP",
        \ "ABV.UNKNOWN_SIZE",
        \ "ASSIGCOND.CALL",
        \ "ASSIGCOND.GEN",
        \ "BSTR.CAST.C",
        \ "BSTR.CAST.CPP",
        \ "BSTR.FUNC.ALLOC",
        \ "BSTR.FUNC.FREE",
        \ "BSTR.FUNC.LEN",
        \ "BSTR.FUNC.REALLOC",
        \ "BSTR.IA.ASSIGN",
        \ "BSTR.IA.INIT",
        \ "BSTR.OPS.ARITHM",
        \ "BSTR.OPS.COMP",
        \ "BSTR.OPS.EQS",
        \ "BYTEORDER.HTON.SEND",
        \ "BYTEORDER.HTON.WRITE",
        \ "BYTEORDER.NTOH.READ",
        \ "BYTEORDER.NTOH.RECV",
        \ "CL.ASSIGN.NON_CONST_ARG",
        \ "CL.ASSIGN.RETURN_CONST",
        \ "CL.ASSIGN.VOID",
        \ "CL.FFM.ASSIGN",
        \ "CL.FFM.COPY",
        \ "CL.FMM",
        \ "CL.MLK",
        \ "CL.MLK.ASSIGN",
        \ "CL.MLK.VIRTUAL",
        \ "CL.SELF-ASSIGN",
        \ "CL.SHALLOW.ASSIGN",
        \ "CL.SHALLOW.COPY",
        \ "CONC.DL",
        \ "CONC.NO_UNLOCK",
        \ "CONC.SLEEP",
        \ "CWARN.ALIGNMENT",
        \ "CWARN.BAD.PTR.ARITH",
        \ "CWARN.BITOP.SIZE",
        \ "CWARN.BOOLOP.INC",
        \ "CWARN.CAST.VIRTUAL_INHERITANCE",
        \ "CWARN.CMPCHR.EOF",
        \ "CWARN.CONSTCOND.DO",
        \ "CWARN.CONSTCOND.IF",
        \ "CWARN.CONSTCOND.SWITCH",
        \ "CWARN.CONSTCOND.TERNARY",
        \ "CWARN.CONSTCOND.WHILE",
        \ "CWARN.COPY.NOASSIGN",
        \ "CWARN.DTOR.NONVIRT.DELETE",
        \ "CWARN.DTOR.NONVIRT.NOTEMPTY",
        \ "CWARN.EMPTY.LABEL",
        \ "CWARN.EMPTY.TYPEDEF",
        \ "CWARN.FUNCADDR",
        \ "CWARN.HIDDEN.PARAM",
        \ "CWARN.IMPLICITINT",
        \ "CWARN.INCL.ABSOLUTE",
        \ "CWARN.INCL.NO_INTERFACE",
        \ "CWARN.INLINE.NONFUNC",
        \ "CWARN.MEMBER.INIT.ORDER",
        \ "CWARN.MEM.NONPOD",
        \ "CWARN.MEMSET.SIZEOF.PTR",
        \ "CWARN.NOEFFECT.OUTOFRANGE",
        \ "CWARN.NOEFFECT.SELF_ASSIGN",
        \ "CWARN.NOEFFECT.UCMP.GE",
        \ "CWARN.NOEFFECT.UCMP.GE.MACRO",
        \ "CWARN.NOEFFECT.UCMP.LT",
        \ "CWARN.NOEFFECT.UCMP.LT.MACRO",
        \ "CWARN.NULLCHECK.FUNCNAME",
        \ "CWARN.OVERRIDE.CONST",
        \ "CWARN.PACKED.TYPEDEF",
        \ "CWARN.PASSBYVALUE.ARG",
        \ "CWARN.PASSBYVALUE.EXC",
        \ "CWARN.RET.MAIN",
        \ "CWARN.SIGNEDBIT",
        \ "DBZ.CONST",
        \ "DBZ.CONST.CALL",
        \ "DBZ.GENERAL",
        \ "DBZ.ITERATOR",
        \ "EFFECT",
        \ "FMM.MIGHT",
        \ "FMM.MUST",
        \ "FNH.MIGHT",
        \ "FNH.MUST",
        \ "FREE.INCONSISTENT",
        \ "FUM.GEN.MIGHT",
        \ "FUM.GEN.MUST",
        \ "FUNCRET.GEN",
        \ "FUNCRET.IMPLICIT",
        \ "HCC",
        \ "HCC.PWD",
        \ "HCC.USER",
        \ "INCONSISTENT.LABEL",
        \ "INCORRECT.ALLOC_SIZE",
        \ "INFINITE_LOOP.GLOBAL",
        \ "INFINITE_LOOP.LOCAL",
        \ "INFINITE_LOOP.MACRO",
        \ "INVARIANT_CONDITION.GEN",
        \ "INVARIANT_CONDITION.UNREACH",
        \ "ITER.CONTAINER.MODIFIED",
        \ "ITER.END.DEREF.MIGHT",
        \ "ITER.END.DEREF.MUST",
        \ "ITER.INAPPROPRIATE",
        \ "ITER.INAPPROPRIATE.MULTIPLE",
        \ "LA_UNUSED",
        \ "LOCRET.ARG",
        \ "LOCRET.GLOB",
        \ "LOCRET.RET",
        \ "LS.CALL",
        \ "LS.CALL.STRING",
        \ "LV_UNUSED.GEN",
        \ "MLK.MIGHT",
        \ "MLK.MUST",
        \ "MLK.RET.MIGHT",
        \ "MLK.RET.MUST",
        \ "NNTS.MIGHT",
        \ "NNTS.MUST",
        \ "NNTS.TAINTED",
        \ "NPD.CHECK.CALL.MIGHT",
        \ "NPD.CHECK.CALL.MUST",
        \ "NPD.CHECK.MIGHT",
        \ "NPD.CHECK.MUST",
        \ "NPD.CONST.CALL",
        \ "NPD.CONST.DEREF",
        \ "NPD.FUNC.CALL.MIGHT",
        \ "NPD.FUNC.CALL.MUST",
        \ "NPD.FUNC.MIGHT",
        \ "NPD.FUNC.MUST",
        \ "NPD.GEN.CALL.MIGHT",
        \ "NPD.GEN.CALL.MUST",
        \ "NPD.GEN.MIGHT",
        \ "NPD.GEN.MUST",
        \ "NUM.OVERFLOW",
        \ "PORTING.BITFIELDS",
        \ "PORTING.BSWAP.MACRO",
        \ "PORTING.BYTEORDER.SIZE",
        \ "PORTING.CAST.FLTPNT",
        \ "PORTING.CAST.PTR",
        \ "PORTING.CAST.PTR.FLTPNT",
        \ "PORTING.CAST.PTR.SIZE",
        \ "PORTING.CAST.SIZE",
        \ "PORTING.CMPSPEC.EFFECTS.ASSIGNMENT",
        \ "PORTING.CMPSPEC.TYPE.BOOL",
        \ "PORTING.CMPSPEC.TYPE.LONGLONG",
        \ "PORTING.MACRO.NUMTYPE",
        \ "PORTING.OPTS",
        \ "PORTING.PRAGMA.ALIGN",
        \ "PORTING.PRAGMA.PACK",
        \ "PORTING.SIGNED.CHAR",
        \ "PORTING.STORAGE.STRUCT",
        \ "PORTING.STRUCT.BOOL",
        \ "PORTING.UNIONS",
        \ "PORTING.UNSIGNEDCHAR.OVERFLOW.FALSE",
        \ "PORTING.UNSIGNEDCHAR.OVERFLOW.TRUE",
        \ "PORTING.UNSIGNEDCHAR.RELOP",
        \ "PORTING.VAR.EFFECTS",
        \ "PRECISION.LOSS",
        \ "PRECISION.LOSS.CALL",
        \ "RABV.CHECK",
        \ "RCA",
        \ "RCA.HASH.SALT.EMPTY",
        \ "RETVOID.GEN",
        \ "RETVOID.IMPLICIT",
        \ "RH.LEAK",
        \ "RN.INDEX",
        \ "RNPD.CALL",
        \ "RNPD.DEREF",
        \ "SEMICOL",
        \ "STRONG.TYPE.ASSIGN",
        \ "STRONG.TYPE.ASSIGN.ARG",
        \ "STRONG.TYPE.ASSIGN.CONST",
        \ "STRONG.TYPE.ASSIGN.INIT",
        \ "STRONG.TYPE.ASSIGN.RETURN",
        \ "STRONG.TYPE.ASSIGN.ZERO",
        \ "STRONG.TYPE.EXTRACT",
        \ "STRONG.TYPE.JOIN.CMP",
        \ "STRONG.TYPE.JOIN.CONST",
        \ "STRONG.TYPE.JOIN.EQ",
        \ "STRONG.TYPE.JOIN.OTHER",
        \ "STRONG.TYPE.JOIN.ZERO",
        \ "SV.BANNED.RECOMMENDED.ALLOCA",
        \ "SV.BANNED.RECOMMENDED.NUMERIC",
        \ "SV.BANNED.RECOMMENDED.OEM",
        \ "SV.BANNED.RECOMMENDED.PATH",
        \ "SV.BANNED.RECOMMENDED.SCANF",
        \ "SV.BANNED.RECOMMENDED.SPRINTF",
        \ "SV.BANNED.RECOMMENDED.STRLEN",
        \ "SV.BANNED.RECOMMENDED.TOKEN",
        \ "SV.BANNED.RECOMMENDED.WINDOW",
        \ "SV.BANNED.REQUIRED.CONCAT",
        \ "SV.BANNED.REQUIRED.COPY",
        \ "SV.BANNED.REQUIRED.GETS",
        \ "SV.BANNED.REQUIRED.ISBAD",
        \ "SV.BANNED.REQUIRED.SPRINTF",
        \ "SV.BFC.USING_STRUCT",
        \ "SV.BRM.HKEY_LOCAL_MACHINE",
        \ "SV.CODE_INJECTION.SHELL_EXEC",
        \ "SV.DLLPRELOAD.NONABSOLUTE.DLL",
        \ "SV.DLLPRELOAD.NONABSOLUTE.EXE",
        \ "SV.DLLPRELOAD.SEARCHPATH",
        \ "SV.FIU.PROCESS_VARIANTS",
        \ "SV.FMTSTR.GENERIC",
        \ "SV.FMT_STR.BAD_SCAN_FORMAT",
        \ "SV.FMT_STR.PRINT_FORMAT_MISMATCH.BAD",
        \ "SV.FMT_STR.PRINT_FORMAT_MISMATCH.UNDESIRED",
        \ "SV.FMT_STR.PRINT_IMPROP_LENGTH",
        \ "SV.FMT_STR.PRINT_PARAMS_WRONGNUM.FEW",
        \ "SV.FMT_STR.PRINT_PARAMS_WRONGNUM.MANY",
        \ "SV.FMT_STR.SCAN_FORMAT_MISMATCH.BAD",
        \ "SV.FMT_STR.SCAN_FORMAT_MISMATCH.UNDESIRED",
        \ "SV.FMT_STR.SCAN_IMPROP_LENGTH",
        \ "SV.FMT_STR.SCAN_PARAMS_WRONGNUM.FEW",
        \ "SV.FMT_STR.SCAN_PARAMS_WRONGNUM.MANY",
        \ "SV.FMT_STR.UNKWN_FORMAT",
        \ "SV.FMT_STR.UNKWN_FORMAT.SCAN",
        \ "SV.INCORRECT_RESOURCE_HANDLING.URH",
        \ "SV.INCORRECT_RESOURCE_HANDLING.WRONG_STATUS",
        \ "SV.LPP.CONST",
        \ "SV.LPP.VAR",
        \ "SV.PCC.CONST",
        \ "SV.PCC.INVALID_TEMP_PATH",
        \ "SV.PCC.MISSING_TEMP_CALLS.MUST",
        \ "SV.PCC.MISSING_TEMP_FILENAME",
        \ "SV.PCC.MODIFIED_BEFORE_CREATE",
        \ "SV.PIPE.CONST",
        \ "SV.PIPE.VAR",
        \ "SV.RVT.RETVAL_NOTTESTED",
        \ "SV.SIP.CONST",
        \ "SV.SIP.VAR",
        \ "SV.STRBO.BOUND_COPY.OVERFLOW",
        \ "SV.STRBO.BOUND_COPY.UNTERM",
        \ "SV.STRBO.BOUND_SPRINTF",
        \ "SV.STRBO.UNBOUND_COPY",
        \ "SV.STRBO.UNBOUND_SPRINTF",
        \ "SV.STR_PAR.UNDESIRED_STRING_PARAMETER",
        \ "SV.TAINTED.ALLOC_SIZE",
        \ "SV.TAINTED.BINOP",
        \ "SV.TAINTED.CALL.BINOP",
        \ "SV.TAINTED.CALL.DEREF",
        \ "SV.TAINTED.CALL.INDEX_ACCESS",
        \ "SV.TAINTED.CALL.LOOP_BOUND",
        \ "SV.TAINTED.DEREF",
        \ "SV.TAINTED.FMTSTR",
        \ "SV.TAINTED.INDEX_ACCESS",
        \ "SV.TAINTED.INJECTION",
        \ "SV.TAINTED.LOOP_BOUND",
        \ "SV.TAINTED.PATH_TRAVERSAL",
        \ "SV.TAINTED.SECURITY_DECISION",
        \ "SV.TOCTOU.FILE_ACCESS",
        \ "SV.UNBOUND_STRING_INPUT.CIN",
        \ "SV.UNBOUND_STRING_INPUT.FUNC",
        \ "SV.USAGERULES.PERMISSIONS",
        \ "SV.USAGERULES.PROCESS_VARIANTS",
        \ "SV.USAGERULES.SPOOFING",
        \ "SV.WEAK_CRYPTO.WEAK_HASH",
        \ "UFM.DEREF.MIGHT",
        \ "UFM.DEREF.MUST",
        \ "UFM.FFM.MIGHT",
        \ "UFM.FFM.MUST",
        \ "UFM.RETURN.MIGHT",
        \ "UFM.RETURN.MUST",
        \ "UFM.USE.MIGHT",
        \ "UFM.USE.MUST",
        \ "UNINIT.CTOR.MIGHT",
        \ "UNINIT.CTOR.MUST",
        \ "UNINIT.HEAP.MIGHT",
        \ "UNINIT.HEAP.MUST",
        \ "UNINIT.STACK.ARRAY.MIGHT",
        \ "UNINIT.STACK.ARRAY.MUST",
        \ "UNINIT.STACK.ARRAY.PARTIAL.MUST",
        \ "UNINIT.STACK.MIGHT",
        \ "UNINIT.STACK.MUST",
        \ "UNREACH.GEN",
        \ "UNREACH.RETURN",
        \ "UNREACH.SIZEOF",
        \ "UNUSED.FUNC.GEN",
        \ "UNUSED.FUNC.WARN",
        \ "VA_UNUSED.GEN",
        \ "VA_UNUSED.INIT",
        \ "VOIDRET",
        \ ]
endif

function! kw#update_checkers(codes) abort
    "TODO
endfunction

function! kw#complete_checkers(ArgLead, CmdLine, CursorPos) abort
    " TODO: complete subcodes separated buy "."
    let tmp_list = g:kw_checkers_cs + g:kw_checkers_cpp
    call filter(tmp_list, 'v:val =~ "^'.a:ArgLead.'"')
    return tmp_list
endfunction

function! kw#set_settings() abort
    if !exists("g:kw_settings")
        let g:kw_settings = {
            \ "host": "localhost",
            \ "port": 9090,
            \ "user": "gmoshkin",
            \ "project": "cudafy",
            \ }
    endif
    let g:kw_settings["host"] = input("Hostname: ", g:kw_settings["host"])
    let g:kw_settings["port"] = input("Port: ", g:kw_settings["port"])
    let g:kw_settings["user"] = input("Username: ", g:kw_settings["user"])
    let g:kw_settings["project"] = input("Username: ", g:kw_settings["project"])
endfunction

function! kw#get_comment(status) abort
    let default = ""
    if exists("g:kw_comments")
        let default = get(g:kw_comments, a:status, "")
        call kw#add_to_history(default)
    endif
    let result = input("Comment: ", default, "customlist,kw#get_comments_history")
    let g:kw_comments[a:status] = result
    call kw#add_to_history(result)
    return result
endfunction

function! kw#add_to_history(comment) abort
    if !exists("g:kw_comments_history")
        let g:kw_comments_history = []
    endif
    if !empty(a:comment) && index(g:kw_comments_history, a:comment) < 0
        call add(g:kw_comments_history, a:comment)
    endif
endfunction

function! kw#get_comments_history(...) abort
    return get(g:, "kw_comments_history", [])
endfunction

function! kw#set_query(key) abort
    if a:key ==? "code"
        if !exists("g:kw_code_query")
            let g:kw_code_query = ""
        endif
        let default = g:kw_code_query
        let res = input("Checker code: ", default, "customlist,kw#complete_checkers")
        let g:kw_code_query = res
        return g:kw_code_query
    endif
endfunction

function! kw#get_request_string(action, params) abort
    if !exists("g:kw_settings")
        echoerr "g:kw_settings is unset"
        return ""
    endif
    let params = []
    call add(params, "action=".a:action)
    call add(params, "user=".g:kw_settings["user"])
    call add(params, "project=".g:kw_settings["project"])
    for [k, v] in items(a:params)
        call add(params, k."=".substitute(v, " ", "+", "g"))
    endfor
    if index(keys(a:params), "owner") < 0
        call add(params, "owner=".g:kw_settings["user"])
    endif
    let request = join(params, "&")
    return request
endfunction

function! kw#get_address_string() abort
    if !exists("g:kw_settings")
        echoerr "g:kw_settings is unset"
        return ""
    endif
    let address = "http://"
    let address .= g:kw_settings["host"].":".g:kw_settings["port"]
    let address .= "/review/api"
    return address
endfunction

function! kw#update_status(ids, status, ...) abort
    let comment = ""
    if a:0 < 1
        let comment = kw#get_comment(a:status)
    endif
    let params = {
        \ "ids" : a:ids,
        \ "status" : a:status,
        \ "comment" : comment,
        \ }
    let request = kw#get_request_string("update_status", params)
    let response = kw#send_request(request, "load")
    echo response["status_message"]
endfunction

function! kw#load_queries(...) abort
    if a:0 == 0
        return
    endif
    let query_params = []
    for a in a:000
        call add(query_params, a.":".kw#set_query(a))
    endfor
    let g:kw_last_query = join(query_params, ",")
    let response = kw#search_query(g:kw_last_query, "load")
    call kw#parse_issues(response)
endfunction

function! kw#search_queries(...) abort
    if a:0 == 0
        return
    endif
    let query_params = []
    for a in a:000
        call add(query_params, a.":".kw#set_query(a))
    endfor
    let g:kw_last_query = join(query_params, ",")
    call kw#search_query(g:kw_last_query, "read")
endfunction

function! kw#search_last_query() abort
    if !exists("g:kw_last_query")
        echoerr "g:kw_last_query is not set"
        return
    endif
    call kw#search_query(g:kw_last_query, "read")
endfunction

function! kw#search_query(query, action) abort
    let params = {
        \ "query" : a:query
        \ }
    let request = kw#get_request_string("search", params)
    call kw#send_request(request, a:action)
endfunction

function! kw#send_request(request, ...) abort
    let address = kw#get_address_string()
    let prefix = ""
    let curl_options = ""
    if a:0 > 0
        if a:1 ==? "read"
            let execute = 1
            let prefix = "read !"
            let curl_options = "--stderr /dev/null"
        elseif a:1 ==? "load"
            let execute = 0
            let prefix = ""
            let curl_options = "--stderr /dev/null"
        endif
    else
        let prefix = "!"
        let execute = 1
    endif
    let cmd = prefix.'curl '.curl_options.' --data "'.a:request.'" '.address
    if execute
        " echom "executing '".cmd."'"
        execute cmd
    else
        return systemlist(cmd)
    endif
endfunction

function! kw#parse_issues(issues) abort
    let g:kw_issues = {}
    for i in a:issues
        let issue = json_decode(i)
        let g:kw_issues[issue["id"]] = issue
    endfor
    let g:kw_issue_ids = sort(map(keys(g:kw_issues), 'v:val + 0'))
    if len(g:kw_issue_ids) > 0
        let g:kw_current_issue_id = g:kw_issue_ids[0]
        call kw#parse_issue(g:kw_issues[g:kw_current_issue_id])
    endif
    echo 'Loaded '.len(g:kw_issues).' issues. Current issue id is '.g:kw_current_issue_id
endfunction

function! kw#parse_trace(trace) abort
    if empty(a:trace)
        return []
    endif
    let res = []
    let file = a:trace["file"]
    let entity = a:trace["entity"]
    for l in a:trace["lines"]
        let err = {
            \ "filename" : file,
            \ "lnum" : l["line"],
            \ "text" : l["text"],
            \ "type" : "Error",
            \ "nr" : -1,
            \ "entity" : entity,
            \ }
        call add(res, err)
        let trace = get(l, "trace", {})
        call extend(res, kw#parse_trace(trace))
    endfor
    return res
endfunction

function! kw#parse_issue(...) abort
    if a:0 < 1
        if !exists("g:kw_current_issue")
            echoerr "g:kw_current_issue doesn't exist"
            return
        else
            let issue = g:kw_current_issue
        endif
    else
        let issue = a:1
        if type(a:1) == v:t_string
            let issue = json_decode(a:1)
        endif
        let g:kw_current_issue = issue
        let g:kw_current_issue_id = issue["id"]
    endif
    let qf_list = []
    let err = {
        \ "filename" : issue["file"],
        \ "lnum" : issue["line"],
        \ "text" : issue["message"],
        \ "type" : "Error",
        \ "nr" : -1,
        \ }
    call add(qf_list, err)
    call extend(qf_list, kw#parse_trace(issue["trace"][0]))
    call setqflist(qf_list)
endfunction

function! kw#parse_prev() abort
    call kw#_parse_next(-1)
endfunction

function! kw#parse_next() abort
    call kw#_parse_next(+1)
endfunction

function! kw#_parse_next(ofs) abort
    let newindex = index(g:kw_issue_ids, g:kw_current_issue_id) + a:ofs
    if a:ofs > 0 && newindex > len(g:kw_issue_ids) - 1
        echo "Reached the last issue"
        return
    elseif a:ofs < 0 && newindex < 0
        echo "Reached the first issue"
        return
    endif
    let g:kw_current_issue_id = g:kw_issue_ids[newindex]
    echo "Issue id: ".g:kw_current_issue_id." (".(newindex - 1)."/".len(g:kw_issues).")"
    call kw#parse_issue(g:kw_issues[g:kw_current_issue_id])
endfunction
