-- Walk upward from the current buffer. The nested list gives every marker
-- equal priority, so the nearest directory that contains one of them wins.
-- Falls back to "../..".
local function get_project_root()
  return vim.fs.root(0, { { '.git', '.vscode', 'p4', 'init.lua' } }) or '../..'
end

return get_project_root
