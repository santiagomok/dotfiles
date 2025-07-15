-- WezTerm
-- https://wezfurlong.org/wezterm

-- Pull in the wezterm API
local wezterm = require 'wezterm'


-- Bind keys and send to neovim
local function bind_keys_in_nvim(key, mods)
  return function(window, pane)
    local is_nvim = pane:get_foreground_process_name():match(".*/([^/]+)$") == "nvim"

    if not is_nvim then return end

    window:perform_action({ SendKey = { key = key, mods = mods } }, pane)
  end
end

-- This table will hold the configuration
local config = {}

-- Smart tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Color scheme
-- config.color_scheme = "Seti"
-- config.color_scheme = 'OneHalfDark'
config.color_scheme = 'One Half Black (Gogh)'
-- config.color_scheme = 'One Dark (Gogh)'

-- Font configuraiton
--config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })  -- default
-- font = wezterm.font('Source Code Pro', {weight="Regular"}), 
config.font = wezterm.font('FiraCode Nerd Font Mono', {weight="Regular"})
config.font_size = 14.0

-- config.disable_default_key_bindings = true

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
  { key = '1', mods = 'CMD', action = wezterm.action_callback(bind_keys_in_nvim('1', 'CTRL')) },
  -- { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  -- { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
  { key = '2', mods = 'CMD', action = wezterm.action_callback(bind_keys_in_nvim('2', 'CTRL')) },
}

return config
