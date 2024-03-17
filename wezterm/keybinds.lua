local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

---------------------------------------------------------------
--- keybinds                                                  +
---------------------------------------------------------------

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
                key    = 'w',
                mods   = 'ALT',
                action = act.ActivatePaneDirection 'Next',
        },
        {
                key    = 'w',
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
                key    = "s",
                mods   = "SUPER",
                action = act { SendString = "\x1bs" },
        },
}


for _, v in pairs(keybinds) do
        table.insert(M, v)
end

return M
