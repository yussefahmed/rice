local awful = require("awful")

local M = {}

function M.setup(screen, default_layout, top_padding)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, screen, default_layout)
    screen.padding = { top = top_padding }
end

return M
