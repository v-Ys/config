local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

---------------------------------------------------------------
--- keybinds                                                  +
---------------------------------------------------------------

local keybinds = {
    {
        key    = 'Tab',
        mods   = 'ALT',
        action = act.ActivateTabRelative(1),
    },

    {
        key    = 'Tab',
        mods   = 'ALT|SHIFT',
        action = act.ActivateTabRelative( -1),
    },

    {
        key    = 'v',
        mods   = 'CTRL|ALT',
        action = wezterm.action.SplitPane {
            direction = 'Right',
            -- command = { args = { 'top' } },
            size = { Percent = 50 },
        },
    },
    {
        key    = 'w',
        mods   = 'CTRL|ALT',
        action = act.ActivatePaneDirection 'Next',
    },
    {
        key    = 'w',
        mods   = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },

    },
    {
        key    = "s",
        mods   = "CMD",
        action = wezterm.action { SendString = "\x1bs" },
    }
}


for _, v in pairs(keybinds) do
        table.insert(M, v)
end

return M
