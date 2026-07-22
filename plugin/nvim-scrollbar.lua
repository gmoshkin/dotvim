require('scrollbar').setup {
    show_in_active_only = true,
    handle = {
        -- For termguicolors on
        color = '#404040',
        -- For termguicolors off
        color_nr = 238,
    },
    handlers = {
        cursor = false,
    },
    marks = {
        Error = { color = '#ff5555' },
        Warn = { color = '#f1fa4c' },
    },
}

-- nvim-scrollbar's diagnostic handler indexes marks[severity]; LSP makes
-- `severity` optional and nvim preserves the nil, so a diagnostic without
-- severity crashes its diagnostic_mapper (marks[nil].text). The handler
-- re-fetches via vim.diagnostic.get, so we normalise at the storage layer.
local orig_set = vim.diagnostic.set
vim.diagnostic.set = function(namespace, bufnr, diagnostics, opts)
    for _, d in ipairs(diagnostics or {}) do
        local s = d.severity
        if s == nil or s < 1 or s > 4 then
            d.severity = vim.diagnostic.severity.ERROR
        end
    end
    return orig_set(namespace, bufnr, diagnostics, opts)
end
