local window = require "hs.window"
local M = {}
M.windowManager = function(size)
        return function()
                if size == "fullScreen" then
                        local win = window.focusedWindow()
                        if win ~= nil then
                                win:setFullScreen(not win:isFullScreen())
                        end
                end

                local winSize = {
                        top = { 0, 0, 1, 0.5 },
                        left = { 0, 0, 0.5, 1 },
                        right = { 0.5, 0, 0.5, 1 },
                        bottom = { 0, 0.5, 1, 0.5 },
                }
                window.focusedWindow():moveToUnit(winSize[size])
        end
end

return M
