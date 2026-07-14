-- blink.cmp: completion popup merging LSP, filesystem paths and buffer words.
-- Replaces coc.nvim's completion.
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        -- Keep the old coc bindings: <C-f> / <Right> accept the selection when
        -- the menu is open, otherwise fall back to their normal behaviour.
        ['<C-f>'] = { 'accept', 'fallback' },
        ['<Right>'] = { 'accept', 'fallback' },
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
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
