-- WezTerm
-- https://wezfurlong.org/wezterm

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration
local config = {}

-- Smart tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Color scheme
config.color_scheme = "Seti"
-- config.color_scheme = 'OneHalfDark'
-- config.color_scheme = 'VibrantInk'

-- Font configuraiton
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })  -- default
-- font = wezterm.font('Source Code Pro', {weight="Regular"}), 
-- font = wezterm.font('FiraCode Nerd Font', {weight="Light"}), 
config.font_size = 14.0

config.keys = {
  -- Turn off the default CMD-SHIFT-{} tab switcher, 
  -- allowing CMD-SHIFT-{} for vim tabs switch.
  { key = '{', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
  { key = '{', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
  { key = '}', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
  { key = '}', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
  { key = '[', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
  { key = ']', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
  -- { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  -- { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
  -- { key = '1', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
  -- { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  -- { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
}

return config
