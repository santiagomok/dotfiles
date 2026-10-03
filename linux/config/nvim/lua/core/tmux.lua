-- Smart directional navigation between Neovim splits and tmux panes
local function tmux_navigate(direction, tmux_dir)
  -- Try moving to a native Neovim window split first
  local cur_win = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. direction)
  
  -- If our window ID didn't change, we hit the edge of Neovim -> move tmux pane
  if cur_win == vim.api.nvim_get_current_win() and vim.env.TMUX then
    vim.fn.system({ "tmux", "select-pane", "-" .. tmux_dir })
  end
end

-- Map the navigation hotkeys globally in Normal mode
vim.keymap.set("n", "<C-h>", function() tmux_navigate("h", "L") end, { desc = "Navigate Left / Tmux Left" })
vim.keymap.set("n", "<C-j>", function() tmux_navigate("j", "D") end, { desc = "Navigate Down / Tmux Down" })
vim.keymap.set("n", "<C-k>", function() tmux_navigate("k", "U") end, { desc = "Navigate Up / Tmux Up" })
vim.keymap.set("n", "<C-l>", function() tmux_navigate("l", "R") end, { desc = "Navigate Right / Tmux Right" })

