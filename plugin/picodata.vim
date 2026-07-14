function! PDLogHL() abort
    highlight Instance_i1 ctermfg=blue
    highlight Instance_i2 ctermfg=green
    highlight Instance_i3 ctermfg=magenta
    highlight Instance_i4 ctermfg=red
    highlight Instance_i5 ctermfg=yellow
    highlight Instance_i6 ctermfg=cyan
    lua <<END
        local instance_names = {}
        local name_to_highlight = {}
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

            local highlight = name_to_highlight[instance]
            if not highlight then
                if #instance_names >= 6 then goto continue end

                table.insert(instance_names, instance)
                highlight = 'Instance_i' .. #instance_names
                name_to_highlight[instance] = highlight
            end

            vim.api.nvim_buf_add_highlight(0, ns, highlight, i - 1, 0, #line)

            -- vim.print({ i, instance, highlight })
            -- goto exit

            ::continue::
        end
        ::exit::
END
endfunction
