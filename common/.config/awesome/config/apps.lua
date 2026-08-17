local awful = require("awful")

local apps = {}

apps.terminal = "xfce4-terminal"
apps.editor = os.getenv("EDITOR") or "nvim"
apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.modkey = "Mod4"

apps.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  awful.layout.suit.corner.nw,
}

return apps
