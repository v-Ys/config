local M = {}
local application = require 'hs.application'
local alert = require 'hs.alert'
local timer = require 'hs.timer'

local function getBundleID(appName)
        local script = 'osascript -e \'id of app "' .. appName .. '"\''
        local handle = io.popen(script)
        if handle ~= nil then
                local result = handle:read("*a")
                handle:close()
                return string.gsub(result, "\n", "")
        end
end

local function notFullScreenApp(appName)
        local appNotFullScreen = {
                ["Preview"] = true,
                ["WezTerm"] = true,
                -- ["Alacritty"] = true,
        }
        if appNotFullScreen[appName] ~= nil then
                return true
        else
                return false
        end
end

local function sleep(appName)
        local appToSleep = {
                ["Visual Studio Code"] = "0.3",
                ["Notes"] = "0.3",
        }
        if appToSleep[appName] == nil then
                return
        end
        os.execute("sleep " .. appToSleep[appName])
end

local function launchApp(appName, appBundleID)
        local runApp = application.launchOrFocusByBundleID(appBundleID)

        if runApp == false then
                alert('Failed to launch app: ' .. appName)
        elseif notFullScreenApp(appName) then
                return
        else
                -- for fullScreen when first lanuch
                local checkTimerTimeoutCounter = 0
                CheckTimer = timer.new(0.1, function()
                        if checkTimerTimeoutCounter == 500 then
                                CheckTimer:stop()
                                checkTimerTimeoutCounter = 0
                                return
                        end

                        local appsFirstLanuch = application.applicationsForBundleID(appBundleID)
                        local appFirstLanuch = appsFirstLanuch and appsFirstLanuch[1]
                        if appFirstLanuch then
                                os.execute("sleep 0.5")
                                sleep(appName)
                                if appFirstLanuch:activate() then
                                        local focusedWindow = appFirstLanuch:focusedWindow()
                                        if focusedWindow then
                                                focusedWindow:setFullScreen(true)
                                                CheckTimer:stop()
                                                checkTimerTimeoutCounter = 0
                                                return
                                        end
                                end
                        end
                        checkTimerTimeoutCounter = checkTimerTimeoutCounter + 1
                end)
                CheckTimer:start()
                return
        end
end

local function focusApp(app, appBundleID)
        local MainWin = app:mainWindow()
        if MainWin then
                if MainWin:isFullScreen() == true then
                        MainWin:application():activate(true)
                        MainWin:focus()
                elseif app:isFrontmost() == true then
                        MainWin:application():hide()
                else
                        MainWin:application():activate(true)
                        MainWin:application():unhide()
                        MainWin:focus()
                end
        else
                application.launchOrFocusByBundleID(appBundleID)
        end
end



M.lanuchOrFocusApp = function(appName)
        return function()
                local appBundleID = getBundleID(appName)
                if not appBundleID then
                        return
                end

                local appsIsRunning = application.applicationsForBundleID(appBundleID)
                local appIsRunning = appsIsRunning and appsIsRunning[1]

                -- If app is not open, then open it and go fullscreen
                if not appIsRunning then
                        launchApp(appName, appBundleID)
                end

                -- or focus app
                focusApp(appIsRunning, appBundleID)
        end
end

M.FocusDesktop = function()
        return function()
                local desktop = require("hs.window").desktop()
                desktop:application():activate(true)
                desktop:focus()
        end
end

return M
