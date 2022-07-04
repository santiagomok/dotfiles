-- WezTerm
-- https://wezfurlong.org/wezterm

local wezterm = require 'wezterm'

return {
    -- Smart tab bar
    hide_tab_bar_if_only_one_tab = true, 

    -- Color scheme
    color_scheme = "Seti", 
    -- color_scheme = 'VibrantInk', 
    -- color_scheme = 'OneHalfDark', 

    -- Font configuraiton
    font = wezterm.font("JetBrains Mono", {weight="Regular"}),  -- default
    -- font = wezterm.font('Source Code Pro', {weight="Regular"}), 
    -- font = wezterm.font('FiraCode Nerd Font', {weight="Light"}), 
    font_size = 12.0, 

}
