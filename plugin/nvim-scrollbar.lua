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
