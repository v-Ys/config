local wezterm = require 'wezterm'
local act = wezterm.action

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

local keybinds = {

        {
                key    = 't',
                mods   = 'SUPER',
                action = act { SpawnTab = "CurrentPaneDomain" },
        },
        {
                key    = 'T',
                mods   = 'SUPER',
                action = act { SpawnTab = "DefaultDomain" },
        },
        {
                key    = 'Tab',
                mods   = 'ALT',
                action = act.ActivateTabRelative(1),
        },

        {
                key    = 'Tab',
                mods   = 'ALT|SHIFT',
                action = act.ActivateTabRelative(-1),
        },

        {
                key    = '1',
                mods   = 'SUPER',
                action = act { ActivateTab = 0 },
        },

        {
                key    = '2',
                mods   = 'SUPER',
                action = act { ActivateTab = 1 },
        },

        {
                key    = '3',
                mods   = 'SUPER',
                action = act { ActivateTab = 2 },
        },
        {
                key    = '4',
                mods   = 'SUPER',
                action = act { ActivateTab = 3 },
        },
        {
                key    = '5',
                mods   = 'SUPER',
                action = act { ActivateTab = 4 },
        },
        {
                key    = 'v',
                mods   = 'CTRL|ALT',
                action = act.SplitPane {
                        direction = 'Right',
                        size = { Percent = 50 },
                },
        },
        {
                key    = ']',
                mods   = 'ALT',
                action = act.ActivatePaneDirection 'Next',
        },
        {
                key    = 'W',
                mods   = 'SUPER',
                action = act.CloseCurrentPane { confirm = true },

        },
        {
                key    = 'q',
                mods   = 'SUPER',
                action = act.CloseCurrentPane { confirm = true },

        },
        {
                key = "c",
                mods = "SUPER",
                action = act { CopyTo = "Clipboard" },
        },
        {
                key = "v",
                mods = "SUPER",
                action = act { PasteFrom = "Clipboard" },
        },
        {
                key    = 'n',
                mods   = 'SUPER',
                action = act.SpawnWindow
        },
        {
                key    = '-',
                mods   = 'SUPER',
                action = act.DecreaseFontSize
        },
        {
                key    = '=',
                mods   = 'SUPER',
                action = act.IncreaseFontSize
        },
        {
                key    = '0',
                mods   = 'SUPER',
                action = act.ResetFontSize
        },
        {
                key    = "w",
                mods   = "SUPER",
                action = act { SendString = "\x1bw" },
        },
}


return {
        disable_default_key_bindings = true,
        keys = keybinds,

        -- iosevka 16 1 98
        -- SF Mono 14.9 1 1
        font_size = 14.9,
        cell_width = 1,
        line_height = 1,
        font = wezterm.font_with_fallback {
                {
                        family = 'SF Mono',
                        weight = 500,
                },
                {
                        family = 'IosevkaTerm Nerd Font Mono',
                        weight = 500,
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
