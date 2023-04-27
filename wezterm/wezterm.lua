local wezterm = require 'wezterm'
local MyKey = require('keybinds')

--FIX: ?????
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
        disable_default_key_bindings = false,
        font_size = 16,
        cell_width = 1,
        line_height = 0.98,
        font = wezterm.font('Iosevka Nerd Font Mono',
                { weight = 500, italic = false, }),
        enable_tab_bar = false,
        color_scheme = "OneLight (Gogh)",
        -- color_scheme = "TokyoNight (Gogh)",
        -- color_scheme = 'Catppuccin Mocha',
        window_padding = {
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
        },
        colors = {
                compose_cursor = 'orange',
                cursor_bg = '#52ad70',
                cursor_fg = 'black',
        },
        window_decorations = "RESIZE",
        -- default_prog = { '/opt/homebrew/bin/zsh', '-l' },
        keys = MyKey,
}
