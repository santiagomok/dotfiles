local get_project_root = require('plugins.project')

-- Prompt shows only the last `n` directories of the picker cwd.
local function prompt_last_dirs(dir, n)
  local full = vim.fn.fnamemodify(dir, ':p'):gsub('/+$', '')
  local parts = vim.split(full, '/', { trimempty = true })
  local start_at = math.max(#parts - n + 1, 1)
  return table.concat(parts, '/', start_at) .. '/'
end

local function files_picker(opts)
  opts = opts or {}
  opts.cwd_prompt = false
  opts.prompt = prompt_last_dirs(opts.cwd or vim.uv.cwd(), 3)
  require('fzf-lua').files(opts)
end

require('fzf-lua').setup({
  grep = {
    -- rg collects the lines. grep / grep_project / grep_cword then fuzzy-match them in fzf.
    -- <C-g> toggles the open picker to live ripgrep, where the prompt is a regex.
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
  },
})

-- Keymaps
keymap.set('n', '<leader>F', function()
  files_picker()
end, 'Fzf-lua Find Files')

keymap.set('n', '<leader>ff', function()
  files_picker({ cwd = get_project_root() })
end, 'Find files from Root (.github/.vscode/p4) or ../..')

keymap.set('n', '<leader>T', function()
  require('fzf-lua').tabs()
end, 'Fuzzy search tabs')

keymap.set('n', '<leader>B', function()
  require('fzf-lua').buffers()
end, 'Fuzzy search buffers')

keymap.set('n', '<leader>/', function()
  require('fzf-lua').grep_project({ cwd = get_project_root() })
end, 'Fuzzy search project')

keymap.set('n', '<leader>?', function()
  require('fzf-lua').blines()
end, 'Fuzzy search current buffer')

keymap.set('n', '<leader>*', function()
  require('fzf-lua').grep_cword()
end, 'Fuzzy search word under cursor')

keymap.set('n', '<leader>H', function()
  require('fzf-lua').search_history()
end, 'Fuzzy search history')

keymap.set('n', '<F2>', function()
  require('fzf-lua').keymaps()
end, 'List keymaps')

-- Perforce
vim.g.vp4_perforce_executable = 'p4q'

keymap.set('n', '<leader><C-e>', ':Vp4Edit<cr>', 'p4 edit current file')
keymap.set('n', '<leader><C-c>', ':Vp4Change<cr>', 'p4 change description')
keymap.set('n', '<leader><C-R>', ':Vp4Revert<cr>', 'p4 revert current file')
keymap.set('n', '<F7>', ':Vp4Diff ', 'p4 diff current file')
keymap.set('n', '<F8>', ':Vp4Shelve<cr>', 'p4 shelve current file')
keymap.set('n', '<F9>', ':Vp4Filelog<cr>', 'p4 filelog current file')
keymap.set('n', '<leader>PP', ':Vp4', 'run p4 command')
