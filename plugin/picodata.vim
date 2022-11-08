function! PDLogHL() abort
    highlight Instance_i1 ctermfg=blue
    highlight Instance_i2 ctermfg=green
    highlight Instance_i3 ctermfg=magenta
    highlight Instance_i4 ctermfg=red
    highlight Instance_i5 ctermfg=yellow
    highlight Instance_i6 ctermfg=cyan
    lua <<END
        local instances = { 'i1', 'i2', 'i3', 'i4', 'i5', 'i6' }
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local ns = vim.api.nvim_create_namespace('picodata_log_highlight')
        for i, line in ipairs(lines) do
            local ofs = line:find('|')
            if ofs == nil then goto continue end
            local lend = ofs - 1
            while lend > 0 and line:sub(lend, lend) == ' ' do
                lend = lend - 1
            end
            local instance = line:sub(1, lend)
            if vim.tbl_contains(instances, instance) then
                vim.api.nvim_buf_add_highlight(0, ns, 'Instance_' .. instance, i - 1, 0, #line)
            end

            -- goto exit

            ::continue::
        end
        ::exit::
END
endfunction
