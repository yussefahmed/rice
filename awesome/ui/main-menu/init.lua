local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local M = {}

function M.setup(config)
    local terminal = config.terminal
    local editor_cmd = config.editor_cmd

    local myawesomemenu = {
        { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "Manual", terminal .. " -e man awesome" },
        { "Edit config", editor_cmd .. " " .. awesome.conffile },
        { "Restart", awesome.restart },
        { "Quit", function() awesome.quit() end }
    }

    local menu_awesome = { " Awesome", myawesomemenu }
    local menu_terminal = { " Terminal", terminal }
    local menu_browser = { " Browser", "firefox" }
    local menu_files = { "Files", "nautilus" }

    local mymainmenu = awful.menu({
        items = {
            menu_awesome,
            menu_terminal,
            menu_browser,
            menu_files
        },
        theme = {
            height = 20,
            width = 160,
            bg_normal = "#374247",
            bg_focus = "#f7f4e0",
            fg_normal = "#ffffff",
            fg_focus = "#374247"
        }
    })

    local mylauncher = awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = mymainmenu
    })

    menubar.utils.terminal = terminal

    return {
        myawesomemenu = myawesomemenu,
        mymainmenu = mymainmenu,
        mylauncher = mylauncher,
    }
end

return M
