local wezterm = require 'wezterm'
local MyKey = require('keybinds')

local theme = {
        "nord",
        'Catppuccin Mocha',
        "OneLight (Gogh)",
}

return {
        disable_default_key_bindings = true,
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
        -- font_rules = {
        --         {
        --                 intensity = 'Bold',
        --                 italic = true,
        --                 font = wezterm.font {
        --                         -- family = 'Iosevka Nerd Font Mono',
        --                         family = 'SF Mono',
        --                         -- weight = 'ExtraBold',
        --                         weight = 'Bold',
        --                         style = 'Italic',
        --                 },
        --         },
        --         {
        --                 intensity = 'Bold',
        --                 italic = false,
        --                 font = wezterm.font {
        --                         -- family = 'Iosevka Nerd Font Mono',
        --                         family = 'SF Mono',
        --                         -- weight = 'ExtraBold',
        --                         weight = 'Bold',
        --                         style = 'Normal',
        --                 },
        --         },
        -- },
        color_scheme = theme[3],

        window_padding = {
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
        },
        colors = {
                compose_cursor = 'orange',
                cursor_bg = '#CCCCCC',
                cursor_fg = '#000000',
        },
        window_decorations = "RESIZE",
        -- default_prog = { '/opt/homebrew/bin/zsh', '-l' },
        keys = MyKey,

        enable_tab_bar = false,
}
