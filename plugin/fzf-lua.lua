-- fzf-lua: fuzzy pickers over LSP results, for when filtering a long list is
-- nicer than the quickfix window. The plain <leader>g* / <leader>od maps in
-- plugin/lsp.lua keep using the default quickfix/loclist flow; these capital-G
-- (and <leader>fs) maps are the fuzzy alternatives. Reuses the same fzf binary
-- as junegunn/fzf; does not replace fzf.vim's :Files/:Buffers/:Rg.
local fzf = require('fzf-lua')
fzf.setup({})

local function map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { silent = true, desc = desc })
end

-- Direct replacement for the old `<leader>fs` -> `:CocList symbols`.
map('<leader>fs', fzf.lsp_live_workspace_symbols, 'LSP workspace symbols (fzf)')

map('<leader>Gr', fzf.lsp_references, 'LSP references (fzf)')
map('<leader>Gs', fzf.lsp_live_workspace_symbols, 'LSP workspace symbols (fzf)')
map('<leader>Gd', fzf.diagnostics_document, 'Buffer diagnostics (fzf)')
map('<leader>GD', fzf.diagnostics_workspace, 'Workspace diagnostics (fzf)')
