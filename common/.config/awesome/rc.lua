pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme / notifications
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Hotkeys popup extras
require("awful.hotkeys_popup.keys")

-- Error handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors,
  })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    if in_error then
      return
    end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err),
    })

    in_error = false
  end)
end

-- Load app vars
local apps = require("config.apps")

-- Theme
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Layouts
awful.layout.layouts = apps.layouts

-- Menu
local menu = require("config.menu")

-- Keys / mouse
local keys = require("config.keys")
root.keys(keys.globalkeys)
root.buttons(keys.root_buttons(menu.mainmenu))

-- Wibar
require("config.wibar")(menu)

-- Rules
require("config.rules")(keys)

-- Signals
require("config.signals")()
