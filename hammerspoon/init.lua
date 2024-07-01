local hk = require "hs.hotkey"
local lanuchOrFocusApp = require("app").lanuchOrFocusApp
local windowManager = require('window').windowManager
local FocusDesktop = require('app').FocusDesktop


-- window manager
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "q", windowManager("fullScreen"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "m", windowManager("right"))
hk.bind({ 'ctrl', 'cmd', 'alt', 'shift' }, "n", windowManager("left"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "p", windowManager("top"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "o", windowManager("bottom"))

-- lanuch or focue app
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "z", lanuchOrFocusApp("Preview"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "d", lanuchOrFocusApp("kitty"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "f", lanuchOrFocusApp("Arc"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "x", lanuchOrFocusApp("Craft"))
hk.bind({ 'ctrl', 'alt', 'cmd', 'shift' }, "r", FocusDesktop())
hk.bind({ 'ctrl', 'cmd', 'shift' }, "down", lanuchOrFocusApp("Reminders"))
hk.bind({ 'ctrl', 'cmd', 'shift' }, "up", lanuchOrFocusApp("Notes"))
