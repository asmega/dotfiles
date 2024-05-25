-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.use_fancy_tab_bar = false

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = '#406d24',
      fg_color = '#c0c0c0',
    }
  }
}

local act = wezterm.action

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = act.MoveTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = act.MoveTabRelative(1)
  },
}

-- and finally, return the configuration to wezterm
return config
