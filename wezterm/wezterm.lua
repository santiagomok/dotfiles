-- Pull in the WezTerm API
local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Enable modern key mapping detection (Works on macOS & inside WSL/SSH)
config.enable_kitty_keyboard = true

-- -----------------------------------------------------------------------------
-- Shell & OS-Specific Conditional Logic
-- -----------------------------------------------------------------------------
-- Check if the host operating system is Windows
local is_windows = wezterm.target_triple:find("windows") ~= nil

if is_windows then
  -- --- WINDOWS 11 HOST CONFIGS ---
  
  -- Automatically boot directly into WSL Ubuntu on startup if preferred
  -- Default Domain (WSL2 Ubuntu)
  config.default_domain = 'WSL:Ubuntu'
  config.default_cwd = '~'
  
  -- Optimized input stream layer for WSL & ConPTY interaction, enable C-[ forward as is instead of Escape
  config.allow_win32_input_mode = true
    

  
else
  -- --- MACOS HOST CONFIGS ---
  
  -- Use default macOS native shell configuration (usually zsh)
  -- config.default_prog = { '/bin/zsh', '-l' }
end

-- Try WebGpu first; fall back to OpenGL or Software rendering if it fails
config.front_end = "WebGpu"
-- Optional: If you ever run this config on a headless Linux server via SSH, 
-- you can automatically fall back to software rendering like this:
if wezterm.target_triple:find("linux") and os.getenv("DISPLAY") == nil then
  config.front_end = "Software"
end


-- Automatically discover and load all hosts from ~/.ssh/config
config.ssh_domains = wezterm.default_ssh_domains()

-- Optional optimization: Adjust settings for all discovered domains
-- (e.g., if you don't have WezTerm installed on your remote servers, 
--  setting multiplexing = "None" ensures pane/tab closing behaves normally)
for _, dom in ipairs(config.ssh_domains) do
  dom.multiplexing = "None"
  dom.assume_shell = "Posix" -- Makes directory-aware tab spawning work better
end

-- TO_REMOVE Default to PowerShell Core (pwsh.exe) if installed, otherwise fallback to Windows PowerShell
-- if wezterm.target_triple:find("windows") then
  -- config.default_prog = {"wsl.exe","~", "-d", "Ubuntu"}
  -- config.default_prog = { "pwsh.exe", "-NoLogo" }
  -- config.default_prog = {"ssh", "-Y", "moksanti@04404913.sc.altera.com"}
-- end


-- ==========================================
-- Modern Aesthetic & Window Styling
-- ==========================================
-- Modern aesthetic: Choose a high-quality color scheme
config.color_scheme = 'Helios (base16)'

-- Font configuration (Make sure to install your chosen Nerd Font)
-- config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font = wezterm.font_with_fallback({
  'GeistMono Nerd Font',
  'JetBrainsMono Nerd Font',
  'Noto Color Emoji',
  'FiraCode Nerd Font',
  'Fragment Mono',
})

config.font_size = 12.0


-- Auto-Maximize Window on Startup
wezterm.on('window-config-reloaded', function(window, pane)
  -- Maximize the window only if it's the initial launch state
  window:maximize()
end)
-- config.start_as_fullscreen = true

-- Fluent / Windows 11 Acrylic blur effects
-- config.win32_system_backdrop = 'Acrylic' -- Options: 'Mica', 'Acrylic', or 'Tabbed'
config.window_background_opacity = 0.85

-- Window padding and decoration settings
config.window_padding = {
  left = 12,
  right = 12,
  top = 10,
  bottom = 10,
}
-- config.window_decorations = "RESIZE" -- Removes the standard legacy window borders
config.hide_tab_bar_if_only_one_tab = true

-- Modern cursor animations
-- config.default_cursor_style = 'BlinkingBar'
-- config.cursor_blink_rate = 600

-- ==========================================
-- Custom Key & Mouse Bindings
-- ==========================================
-- Set up a tmux-like Leader key for managing panes/tabs (CTRL + a)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Quick Windows Muscle-Memory Shortcuts
  -- Sequence to test OSC52: printf '\e]52;c;%s\a' "$(echo -n 'WEZTERM_TEST' | base64)"
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },

  -- Pane Management using Leader Key
  { key = '-', mods = 'LEADER',       action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '\\', mods = 'LEADER',      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'x', mods = 'LEADER',       action = wezterm.action.CloseCurrentPane { confirm = true } },
  
  -- Smart pane navigation (ALT + Arrow Keys)
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

  -- Fast config reload shortcut
  { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.ReloadConfiguration },

  -- Toggle window masimize
  { 
    key = 'F11',
    action = wezterm.action_callback(function(window, pane)
      if is_maximized then
        window:restore()
        is_maximized = false
      else
        window:maximize()
        is_maximized = true
      end
    end),
  },

  -- Open the Launcher Menu (Matches right-clicking the + button)
  { key = 'L', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncher },
  -- { key = 'L', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncherArgs{ flags = 'FUZZY|DOMAINS|LAUNCH_MENU_ITEMS' } },
  
  -- Open a new tab running default WSL2 
  { key = 't', mods = 'CTRL|SHIFT', 
    action = wezterm.action.SpawnCommandInNewTab {
      domain = 'DefaultDomain',
      cwd = '~', -- Tells WSL to target your Linux user home folder
    },
  },
  
  -- Open a vertical split running PowerShell
  {
    key = '\\',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      command = { domain = 'DefaultDomain', cwd = wezterm.home_dir },
    },
  },

  -- Open a new tab SSH'd directly into your remote host
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab {
      DomainName = 'SSH:sc',
    },
  },

  -- Open a vertical split SSH'd directly into your remote host
  -- {
    -- key = 'S',
    -- mods = 'ALT|SHIFT',
    -- action = wezterm.action.SplitPane {
      -- direction = 'Right',
      -- command = { domain = { DomainName = 'SSH:sc' } },
    -- },
  -- },
  -- Bind C-[ to F13 for tmux 'previous-window' keybind
  {
    key = '[',
    mods = 'CTRL',
    action = wezterm.action.SendString '\x1bp',
  },
  -- Intercept Ctrl+Alt+[ locally and inject it into the SSH pipe
  {
    key = '[',
    modifiers = 'CTRL|ALT',
    action = wezterm.action.SendString '\x1b\x1b[', 
  },
  -- Intercept Ctrl+Alt+] locally and inject it into the SSH pipe
  {
    key = ']',
    modifiers = 'CTRL|ALT',
    action = wezterm.action.SendString '\x1b\x1b]', 
  },
}


config.mouse_bindings = {
  -- Paste from the system clipboard on middle-click, even when the
  -- application (e.g. tmux with `mouse on`) has mouse reporting enabled.
  {
	-- Plain middle-click while tmux has the mouse: this is the one that fixes copy from Windows clipboard to remote tmux server. 
	-- mouse_reporting = true tells WezTerm to handle the click itself instead of passing it to tmux, so it pastes the Windows clipboard.
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
    mouse_reporting = true,
  },
  {
	-- Plain middle-click outside tmux: a normal shell gets the same paste.
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    -- Shift+middle-click: this also pastes the clipboard now. 
	-- Before, it pasted the "primary selection", which Windows doesn't really have.
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  -- {
    -- Mouse Bindings: Right-click to paste (similar to Windows Terminal)
    -- event = { Down = { stroke_count = 1, button = 'Right' } },
    -- mods = 'NONE',
    -- action = wezterm.action.PasteFrom 'Clipboard',
  -- },
}

-- Finally, return the configuration to WezTerm
return config
