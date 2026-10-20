-- Send a file:line reference for the visual selection to the next tmux pane.
-- ------
-- Usage
-- ------
-- 1. Set up a split tmux layout with Neovim on the left and cursor chat open on the right.
-- 2. Inside Neovim, press v or V to highlight the lines of code you want to ask Cursor about.
-- 3. Press your leader key followed by cc (e.g., ,cc).
-- 4. "path:start-end" is yanked to the clipboard, loaded into the tmux paste buffer, and pasted into the next pane.
--
-- <C-y> only yanks "path:line" (Normal) or "path:start-end" (Visual) to the clipboard.

-- Lua mappings run like <Cmd>, so Visual mode is still active and line('v') is the other end.
local function yank_file_lines()
  local path = vim.fn.expand('%:p')
  if path == '' then
    vim.notify('No file name to yank', vim.log.levels.WARN)
    return nil
  end

  local start_line = vim.fn.line('.')
  local end_line = start_line
  if vim.fn.mode():find('[vV\22]') then
    start_line = math.min(vim.fn.line('v'), end_line)
    end_line = math.max(vim.fn.line('v'), end_line)
    vim.api.nvim_feedkeys(vim.keycode('<Esc>'), 'nx', false)
  end

  local lines = start_line == end_line and tostring(start_line) or (start_line .. '-' .. end_line)
  local text = path .. ':' .. lines
  vim.fn.setreg('+', text)
  vim.fn.setreg('"', text)
  vim.notify('Yanked ' .. text)
  return text
end

local function yank_file_lines_to_tmux_pane()
  local text = yank_file_lines()
  if not text then
    return
  end

  -- Stdin avoids the shell, so the path stays intact.
  local loaded = vim.fn.system({ 'tmux', 'load-buffer', '-' }, text)
  if vim.v.shell_error ~= 0 then
    vim.notify('tmux load-buffer failed:\n' .. loaded, vim.log.levels.ERROR)
    return
  end

  local pasted = vim.fn.system({ 'tmux', 'paste-buffer', '-t', '.+' })
  if vim.v.shell_error ~= 0 then
    vim.notify(
      'Copied to the tmux buffer, but paste into the next pane failed:\n' .. pasted,
      vim.log.levels.WARN
    )
    return
  end

  vim.notify('Sent ' .. text .. ' to the next tmux pane')
end

vim.keymap.set({ 'n', 'x' }, '<C-y>', yank_file_lines, { desc = 'Yank filename and line number to clipboard' })

vim.keymap.set('x', '<leader>cc', yank_file_lines_to_tmux_pane , { desc = 'Send file:line reference to the next tmux pane' })
