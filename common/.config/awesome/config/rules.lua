local awful = require("awful")
local beautiful = require("beautiful")


local function get_screen_by_name(name)
  for s in screen do
    if s.outputs and s.outputs[name] then
      return s
    end
  end
  return awful.screen.focused() or screen.primary or 1
end

return function(keys)
  awful.rules.rules = {
    {
      rule = {},
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.clientkeys,
        buttons = keys.clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      },
    },

    {
      rule_any = {
        instance = {
          "DTA",
          "copyq",
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",
          "Sxiv",
          "Tor Browser",
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
        },
        name = {
          "Event Tester",
        },
        role = {
          "AlarmWindow",
          "ConfigManager",
          "pop-up",
        },
      },
      properties = { floating = true },
    },

    {
      rule_any = { type = { "normal", "dialog" } },
      properties = { titlebars_enabled = true },
    },
    {
      rule = { class = "songsara" },
      properties = {
        screen = function()
          return get_screen_by_name("HDMI-1")
        end,
        tag = function()
          local target_screen = get_screen_by_name("HDMI-1")
          return target_screen.tags[9] or target_screen.tags[1]
        end,
        switchtotag = true,
        ignore_tags = true,
      }
    },
  }
end
