local wezterm = require 'wezterm'
local MyKey = require('keybinds')

--FIX: ?????
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
        disable_default_key_bindings = false,
        font = wezterm.font('Iosevka Nerd Font Mono',
                { weight = 510, italic = false, }),
        font_size = 18,
        cell_width = 0.95,
        line_height = 1,
        enable_tab_bar = false,
        color_scheme = "OneLight (Gogh)",
        -- color_scheme = "TokyoNight (Gogh)",
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
