-- Copy a visual selection into the tmux paste buffer, then paste it into the next pane.
-- ------
-- Usage
-- ------
-- 1. Set up a split tmux layout with Neovim on the left and cursor chat open on the right.
-- 2. Inside Neovim, press v or V to highlight the lines of code you want to ask Cursor about.
-- 3. Press your leader key followed by cc (e.g., ,cc).
-- 4. The snippet, with file and line markers, is loaded into the tmux paste buffer and pasted into the next pane.

vim.keymap.set('x', '<leader>cc', function()
  -- A Lua visual mapping runs after Visual mode ends. '< and '> are set;
  -- line("v") is not. visualmode() is the last selection type (v, V, or block).
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getregion(start_pos, end_pos, { type = vim.fn.visualmode() })
  local selection_text = table.concat(lines, '\n')
  if selection_text == '' then
    vim.notify('No visual selection to copy', vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand('%:.')
  local start_line = math.min(start_pos[2], end_pos[2])
  local end_line = math.max(start_pos[2], end_pos[2])
  local payload = string.format(
    '--- From %s (Lines %d-%d) ---\n%s\n--- End Context ---\n',
    file,
    start_line,
    end_line,
    selection_text
  )

  -- Stdin avoids the shell, so newlines and quotes in the selection stay intact.
  local loaded = vim.fn.system({ 'tmux', 'load-buffer', '-' }, payload)
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

  vim.notify(string.format('Sent lines %d-%d to the next tmux pane', start_line, end_line))
end, { desc = 'Send visual selection to tmux paste buffer' })
