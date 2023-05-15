lua <<END
function get_flc_under_cursor()
    local file = vim.api.nvim_eval('expand("<cfile>")')
    local curr_line = vim.api.nvim_get_current_line()
    local start, fin = curr_line:find(file)
    if start == nil or fin == nil then
        return file
    end
    local cursor = vim.api.nvim_win_get_cursor('.')
    cursor = { line = cursor[1], column = cursor[2] + 1 }
    while fin <= #curr_line do
        local c = curr_line:sub(fin + 1, fin + 1)
        fin = fin + 1
        if c == '' or c ~= ':' and (c:byte() < 48 or c:byte() > 57) then
            break
        end
    end

    local maybe = curr_line:sub(start, fin - 1)
    local parts = vim.split(maybe, ':')
    if #parts < 2 then
        return file
    end

    local file = parts[1]
    local line = parts[2]

    if #line == 0 then
        return file
    end
    for i=1,#line do
        local c = line:sub(i,i):byte()
        if c < 48 or c > 57 then
            return file
        end
    end

    local column = parts[3]
    if #column == 0 then
        return file, line
    end
    for i=1,#column do
        local c = column:sub(i,i):byte()
        if c < 48 or c > 57 then
            return file, line
        end
    end

    return file, line, column
end

function get_command_to_goto_flc_under_cursor()
    local file, line, column = get_flc_under_cursor()
    local path = vim.api.nvim_call_function('findfile', {file})
    if path == nil then
        error("no such file '" .. file .. "'")
    end
    if line == nil then
        return 'normal! gf'
    end

    local command = 'e ' .. file .. ' | ' .. line
    if column ~= nil then
        command = command .. ' | normal' .. column .. '|'
    end
    return command
end
END

nnoremap <silent> gf :<c-u>exec luaeval('get_command_to_goto_flc_under_cursor()')<cr>
noremap <leader>gf :<C-U>call windows#go_to_window(v:count)<BAR>GoToFileLineColumn <C-R><C-F><CR>
noremap <leader>gF :<C-U>call windows#go_to_window(v:count)<BAR>GoToFileLineColumn <C-R><C-A><CR>

command! -nargs=* GoToFileLineColumn call gf#go_to_file_line_column(<q-args>)
command! -nargs=* GTFLC call gf#go_to_file_line_column(<q-args>)
