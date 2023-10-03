-- define all key bindings here
local hk = require "hs.hotkey"
local hyper = { 'ctrl', 'alt', 'cmd', 'shift' }
local hyper_error = { 'ctrl', 'cmd', 'shift' }
local window = require "hs.window"
local application = require 'hs.application'
local alert = require 'hs.alert'

local function sizeFocusedWindow(mode)
        return function()
                local win = window.focusedWindow()
                local f = win:frame()
                local screen = win:screen()
                local max = screen:frame()
                -- if mode == "FullScreen" then
                --         hs.grid.maximizeWindow()
                --         return
                -- end

                local size = {
                        Max = { x = max.x, y = max.y, w = max.w, h = max.h },
                        Right_Half = { x = max.x + max.w / 2, y = max.y, w = max.w / 2, h = max.h },
                        Left_Half = { x = max.x, y = max.y, w = max.w / 2, h = max.h },
                        Center = { x = max.x + max.w / 5, y = max.y + max.h / 6, w = max.w / 5 * 3, h = max.h / 3 * 2 },
                }

                f = size[mode]
                win:setFrame(f, 0)
        end
end

local function launch_or_toggle_application(_app)
        -- finds a running applications
        local app = application.find(_app)

        if not app then
                -- application not running, launch app
                if false == application.launchOrFocus(_app) then
                        -- launch failed, send notification
                        alert('Failed to launch app: ' .. _app)
                end
                return
        end


        local mainwin = app:mainWindow()
        if mainwin then
                if true == app:isFrontmost() then
                        mainwin:application():hide()
                else
                        mainwin:application():activate(true)
                        mainwin:application():unhide()
                        mainwin:focus()
                end
        else
                -- no window, launchOrFocus
                application.launchOrFocus(_app)
        end
end

local key2App = {
        n = 'Google Chrome',
        u = 'Safari',
        i = 'Alacritty',
        o = 'Craft',
        l = 'WezTerm',
        -- j = 'Google Chrome',
        j = 'Arc.app',
}

for key, ap in pairs(key2App) do
        hk.bind(hyper, key, function() launch_or_toggle_application(ap) end)
end

local App = {
        -- down = 'Google Chrome',
        down = 'Arc.app',
        right = 'WezTerm',
}

for key, ap in pairs(App) do
        hk.bind(hyper_error, key, function() launch_or_toggle_application(ap) end)
end

hk.bind(hyper, "d", sizeFocusedWindow("Right_Half"))
hk.bind(hyper, "w", sizeFocusedWindow("Max"))
hk.bind(hyper, "a", sizeFocusedWindow("Left_Half"))
hk.bind(hyper, "s", sizeFocusedWindow("Center"))
hk.bind(hyper, "q", function()
        local win = window.focusedWindow()
        if win ~= nil then
                win:setFullScreen(not win:isFullScreen())
        end
end)
