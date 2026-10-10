-- Walk upward from the active file to the project root.
-- Stops at a directory named "p4", or one that contains .git or .vscode.
-- Falls back "../..".
local function find_project_root()
  local current_dir = vim.fn.expand('%:p:h')
  if current_dir == '' then
    current_dir = vim.fn.getcwd()
  end

  while current_dir and current_dir ~= vim.fs.dirname(current_dir) do
    if vim.fs.basename(current_dir) == "p4" then
      return current_dir
    end

    local has_git = vim.loop.fs_stat(current_dir .. '/.git')
    local has_vscode = vim.loop.fs_stat(current_dir .. '/.vscode')

    if has_git or has_vscode then
      return current_dir
    end

    current_dir = vim.fs.dirname(current_dir)
  end

  return '../..'
end

return find_project_root
