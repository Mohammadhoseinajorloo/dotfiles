local awful = require("awful")

awful.spawn.once("xrandr --output HDMI-1 --auto --primary --output LVDS-1 --auto --below HDMI-1")
