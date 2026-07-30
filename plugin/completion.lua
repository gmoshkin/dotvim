-- blink.cmp: completion popup merging LSP, filesystem paths and buffer words.
-- Replaces coc.nvim's completion.
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        -- <C-n>/<C-p>: like vanilla keyword completion. The default preset only
        -- moves the selection when the menu is already open; here `select_next`
        -- returns false when it's closed, so we fall through to `show` to open
        -- it. (When there are no completions at all, `fallback` fires vim's
        -- built-in <C-n>/<C-p>.)
        ['<C-n>'] = { 'select_next', 'show', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'show', 'fallback' },
        -- <C-f> / <Right> accept the selection (coc's old <C-f> binding).
        -- `select_and_accept` also picks the first item when nothing is
        -- highlighted yet, and accepting applies the LSP's additionalTextEdits
        -- — e.g. auto-inserting a Rust `use` import.
        ['<C-f>'] = { 'select_and_accept', 'fallback' },
        ['<Right>'] = { 'select_and_accept', 'fallback' },
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
        providers = {
            -- By default blink registers the buffer source as a *fallback* of
            -- the lsp source (`lsp.fallbacks = { 'buffer' }`): buffer words only
            -- appear when the LSP returns zero completions. Drop the fallback so
            -- buffer runs alongside lsp, like vanilla <C-n>/<C-p>. Must be the
            -- function form: blink merges config with tbl_deep_extend('force'),
            -- and an empty table `{}` deep-merged over `{ 'buffer' }` is a no-op
            -- (contributes no keys), leaving the default fallback intact.
            lsp = { fallbacks = function() return {} end },
            -- blink's default buffer source only scans buffers currently shown
            -- in a window. Vanilla <C-n>/<C-p> scan every loaded buffer, so
            -- widen get_bufnrs to all loaded & listed buffers to match.
            buffer = {
                opts = {
                    get_bufnrs = function()
                        return vim.tbl_filter(function(buf)
                            return vim.api.nvim_buf_is_loaded(buf)
                                and vim.bo[buf].buflisted
                                and vim.bo[buf].buftype ~= 'nofile'
                        end, vim.api.nvim_list_bufs())
                    end,
                    -- blink drops any buffer larger than max_async_buffer_size
                    -- *entirely* (retain_buffers filter), and caps the summed
                    -- size across buffers at max_total_buffer_size. The defaults
                    -- (200KB / 500KB) silently exclude large files — e.g. a
                    -- 300KB source file contributes no words at all. Vanilla
                    -- <C-n> has no such cap; raise these so big buffers still
                    -- get scanned (parsing stays async via the rust worker).
                    max_async_buffer_size = 20000000,
                    max_total_buffer_size = 50000000,
                },
            },
        },
    },
    completion = {
        menu = {
            -- Show a plain-text kind (Function, Variable, ...) instead of the
            -- default nerd-font `kind_icon` glyph, which renders as a hollow box
            -- without a patched font.
            draw = {
                columns = { { 'label', 'label_description', gap = 1 }, { 'kind' } },
            },
            -- blink pads menu rows with trailing spaces for alignment; remap the
            -- ExtraWhitespace group (used by vim-trailing-whitespace's :match) to
            -- the menu background inside this window so that padding never shows
            -- up highlighted.
            winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None,ExtraWhitespace:BlinkCmpMenu',
        },
        documentation = {
            window = {
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc,ExtraWhitespace:BlinkCmpDoc',
            },
        },
    },
})

-- Advertise blink's completion capabilities to every LSP server.
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})
