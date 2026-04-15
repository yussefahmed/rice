local awful = require("awful")
-- Autostart Applications
-- We chain commands with '&&' or ';' to ensure order: Kill -> Wait -> Start

-- 1. Compositor (Picom)
awful.spawn.with_shell("killall -q picom; sleep 0.5; picom -b")

-- 2. Status Bar (Polybar)
awful.spawn.with_shell("killall -q polybar; sleep 0.5; polybar")

-- 3. Wallpaper (Nitrogen)
-- We wait a bit longer to ensure the desktop is ready
awful.spawn.with_shell("sleep 1; nitrogen --restore")
