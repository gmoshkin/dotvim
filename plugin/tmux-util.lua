local function show_floating_info(lines)
    -- Create a scratch buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Get cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]

    -- Calculate window dimensions
    local width = 0
    for _, line in ipairs(lines) do
        width = math.max(width, #line)
    end
    local height = #lines

    -- Open floating window
    local win = vim.api.nvim_open_win(buf, false, {
        relative = 'cursor',
        row = 1,
        col = 1,
        width = width + 2,
        height = height,
        style = 'minimal',
        border = 'none',
    })

    -- Auto-close on cursor move
    vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
        buffer = vim.api.nvim_get_current_buf(),
        once = true,
        callback = function()
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end
        end
    })
end

local function get_current_qf_item()
    local qf_info = vim.fn.getqflist({idx = 0})
    local current_idx = qf_info.idx

    if current_idx == 0 then
        return nil
    end

    local qf_list = vim.fn.getqflist()
    local item = qf_list[current_idx]

    return item
end

local function command_QFShowInfo()
    local info = get_current_qf_item()
    if not info then
        return
    end

    local info_lines = vim.split(info.text, '\n')
    show_floating_info(info_lines)
end

vim.api.nvim_create_user_command('QFShowInfo', command_QFShowInfo, {})
