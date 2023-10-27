local wezterm = require 'wezterm'
local MyKey = require('keybinds')

local theme = {
        "nord",
        "TokyoNight (Gogh)",
        'Catppuccin Mocha',
        "OneLight (Gogh)",
}

return {
        disable_default_key_bindings = true,
        font_size = 16,
        cell_width = 1,
        line_height = 0.98,
        font = wezterm.font_with_fallback {
                {
                        family = 'Iosevka Nerd Font Mono',
                        weight = 590,
                        italic = false,
                },
                {
                        family = 'STFangsong',

                }
        },
        font_rules = {
                {
                        intensity = 'Bold',
                        italic = true,
                        font = wezterm.font {
                                family = 'Iosevka Nerd Font Mono',
                                weight = 'ExtraBold',
                                -- weight = 'Bold',
                                style = 'Italic',
                        },
                },
                {
                        intensity = 'Bold',
                        italic = false,
                        font = wezterm.font {
                                family = 'Iosevka Nerd Font Mono',
                                weight = 'ExtraBold',
                                -- weight = 'Bold',
                                style = 'Normal',
                        },
                },
        },
        color_scheme = theme[4],
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

        enable_tab_bar = false,
}
