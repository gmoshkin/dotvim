-- Native vim.lsp configuration (Neovim 0.11+). Replaces coc.nvim.
-- Base server configs (cmd/filetypes/root_markers) come from nvim-lspconfig;
-- the vim.lsp.config() calls below merge our overrides on top. pyrefly and
-- jails are configured in full because nvim-lspconfig doesn't ship them
-- (or, for pyrefly, may not yet — a full config is harmless either way).

-- clangd: overriding `cmd` replaces nvim-lspconfig's default, so include the
-- binary plus our flags. `--compile-commands-dir=build` carries over the old
-- coc-settings.json `clangd.compilationDatabasePath: build`.
vim.lsp.config('clangd', {
    cmd = { 'clangd', '--compile-commands-dir=build', '--background-index' },
})

-- rust_analyzer: settings ported from ~/dotfiles/nvim/coc-settings.json.
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            procMacro = { attributes = { enable = true } },
            diagnostics = {
                disabled = { 'unresolved-proc-macro', 'inactive-code', 'unlinked-file' },
            },
            cfg = { setMiri = false },
            check = { features = { 'all' } },
        },
    },
})

-- lua_ls: settings ported from coc-settings.json. `globals = {'vim'}` keeps the
-- editor's own config files from flagging `vim` as undefined.
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = { preloadFileSize = 1000 },
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                disable = { 'redefined-local', 'lowercase-global' },
                globals = { 'vim', 'box' },
            },
        },
    },
})

-- pyrefly: Meta's Python LSP (the old coc `languageserver` custom entry).
vim.lsp.config('pyrefly', {
    cmd = { 'pyrefly', 'lsp' },
    filetypes = { 'python' },
    root_markers = { 'pyrefly.toml', 'pyproject.toml', '.git' },
})

-- jails: Jai language server (custom, not in nvim-lspconfig).
vim.lsp.config('jails', {
    cmd = { 'jails' },
    filetypes = { 'jai' },
    root_markers = { 'build.jai', 'first.jai', 'main.jai', '.git' },
})

vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'pyrefly', 'jails' })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    float = { border = 'rounded' },
})

-- Keep the sign column always present so the diagnostic W/E sign appearing and
-- disappearing doesn't shift the whole buffer left/right (also stops gitgutter
-- from causing the same jitter).
vim.o.signcolumn = 'yes'

-- Toggle the inline diagnostic virtual text (signs / underline / `\od` float
-- stay). `yod` follows the vim-unimpaired `yo<x>` toggle convention, alongside
-- `yot` for inlay hints.
local diagnostic_virtual_text = true
vim.api.nvim_create_user_command('DiagnosticVirtualTextToggle', function()
    diagnostic_virtual_text = not diagnostic_virtual_text
    vim.diagnostic.config({ virtual_text = diagnostic_virtual_text })
    vim.notify('diagnostic virtual text ' .. (diagnostic_virtual_text and 'on' or 'off'))
end, { desc = 'Toggle diagnostic virtual text' })
vim.keymap.set('n', 'yod', '<Cmd>DiagnosticVirtualTextToggle<CR>',
    { silent = true, desc = 'Toggle diagnostic virtual text' })

-- Inlay hints default off (matches old coc `inlayHints.enable: false`); toggled
-- on demand with `yot` below.

local function map(bufnr, mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

local hl_augroup = vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Keybindings matching the old plugin/mappings/coc.vim.
        map(bufnr, 'n', '<leader>gd', vim.lsp.buf.definition, 'LSP definition')
        map(bufnr, 'n', '<leader>gi', vim.lsp.buf.implementation, 'LSP implementation')
        map(bufnr, 'n', '<leader>gr', vim.lsp.buf.references, 'LSP references')
        map(bufnr, 'n', '<leader>gu', function()
            vim.lsp.buf.references({ includeDeclaration = false })
        end, 'LSP references (excl. declaration)')
        map(bufnr, 'n', '<leader>gt', vim.lsp.buf.hover, 'LSP hover')
        map(bufnr, 'n', '<leader>gh', vim.lsp.buf.hover, 'LSP hover')
        map(bufnr, 'n', '<leader>gT', vim.lsp.buf.type_definition, 'LSP type definition')
        map(bufnr, 'n', '<leader>od', vim.diagnostic.open_float, 'Diagnostics float')

        if client and client:supports_method('textDocument/inlayHint') then
            map(bufnr, 'n', 'yot', function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
            end, 'Toggle inlay hints')
        end

        -- Document highlight on CursorHold (replaces coc's highlight autocmd).
        if client and client:supports_method('textDocument/documentHighlight') then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                group = hl_augroup,
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                group = hl_augroup,
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- :ExpandMacro — rust-analyzer's macro expansion, shown in a scratch vsplit.
vim.api.nvim_create_user_command('ExpandMacro', function()
    local client = vim.lsp.get_clients({ bufnr = 0, name = 'rust_analyzer' })[1]
    if not client then
        vim.notify('rust_analyzer is not attached to this buffer', vim.log.levels.WARN)
        return
    end
    local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
    client:request('rust-analyzer/expandMacro', params, function(err, result)
        if err then
            vim.notify(tostring(err.message or err), vim.log.levels.ERROR)
            return
        end
        if not result then
            vim.notify('No macro under cursor', vim.log.levels.INFO)
            return
        end
        local lines = vim.split(result.expansion, '\n', { plain = true })
        vim.cmd('vsplit')
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_win_set_buf(0, buf)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.bo[buf].filetype = 'rust'
        vim.bo[buf].buftype = 'nofile'
        vim.api.nvim_buf_set_name(buf, '[expand: ' .. (result.name or 'macro') .. ']')
    end, 0)
end, { desc = 'rust-analyzer: expand macro under cursor' })

-- Neutralize vim-trailing-whitespace's ExtraWhitespace highlight inside LSP
-- floating previews (hover, signature help, ...), whose content can carry
-- trailing spaces. winhighlight remaps the group to the float background
-- per-window, regardless of how the highlight gets applied.
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    local bufnr, winid = orig_open_floating_preview(contents, syntax, opts, ...)
    if winid and vim.api.nvim_win_is_valid(winid) then
        local cur = vim.wo[winid].winhighlight
        vim.wo[winid].winhighlight = (cur ~= '' and cur .. ',' or '') .. 'ExtraWhitespace:NormalFloat'
    end
    return bufnr, winid
end

-- Dim inlay hints / virtual-text hints like the old coc highlight links did.
local function set_lsp_highlights()
    vim.cmd('highlight! link LspInlayHint NonText')
    vim.cmd('highlight! link NormalFloat Pmenu')
end
set_lsp_highlights()
vim.api.nvim_create_autocmd('ColorScheme', { callback = set_lsp_highlights })
