local wezterm = require 'wezterm'
local MyKey = require('keybinds')

wezterm.on("gui-startup", function(cmd)
        wezterm.mux.spawn_window(cmd or {
                position = { x = 750, y = 350, },
        })
end)

local theme = {
        "nord",
        'Catppuccin Mocha',
        "OneLight (Gogh)",
}
return {
        disable_default_key_bindings = true,
        keys = MyKey,

        -- iosevka 16 1 98
        -- SF Mono 14.9 1 1
        font_size = 14.9,
        cell_width = 1,
        line_height = 1,
        harfbuzz_features = { 'calt=0' },
        font = wezterm.font_with_fallback {
                {
                        family = 'SF Mono',
                        weight = 540,
                },
                {
                        family = 'Iosevka NFM',
                        weight = 580,
                        italic = false,
                },
                {
                        family = 'STFangsong',

                }
        },

        window_padding = {
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
        },
        window_decorations = "RESIZE",
        enable_tab_bar = false,

        colors = {
                compose_cursor = 'orange',
                cursor_bg = '#CCCCCC',
                cursor_fg = '#000000',
        },
        color_scheme = theme[3],

}
